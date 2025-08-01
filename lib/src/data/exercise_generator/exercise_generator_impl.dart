import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/data/datasources/exercise_store/exercise_store_datasource.dart';
import 'package:the_kids_app/src/data/datasources/learned_word/learned_word_data_source.dart';
import 'package:the_kids_app/src/data/datasources/llm_inference/inference_data_source.dart';
import 'package:the_kids_app/src/data/datasources/llm_model/mdel_data_source.dart';
import 'package:the_kids_app/src/data/dtos/exercise/exercise_dto.dart';
import 'package:the_kids_app/src/data/dtos/exercise/exercise_store_dto.dart';
import 'package:the_kids_app/src/data/dtos/learned_word/learned_word_dto.dart';
import 'package:the_kids_app/src/data/exercise_generator/exercise_generator.dart';
import 'package:the_kids_app/src/data/exercise_generator/exercise_validator.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';

/// Manages the background generation of exercises for learned words.
/// This class integrates prompt generation and response parsing.
class ExerciseGeneratorImpl implements ExerciseGenerator {
  final LearnedWordDataSource _learnedWordDataSource;
  final ExerciseStoreDatasource _exerciseStoreDatasource;
  final ModelDataSource _modelDataSource;
  final InferenceDataSource _inferenceDataSource;

  Isolate? _isolate;
  final ReceivePort _receivePort = ReceivePort();
  SendPort? _sendPort;
  StreamSubscription<dynamic>? _portSubscription;
  StreamSubscription<LearnedWordDto>? _newWordSubscription;

  bool _isPaused = false;
  final List<LearnedWordDto> _wordQueue = [];

  ExerciseGeneratorImpl(
    this._learnedWordDataSource,
    this._exerciseStoreDatasource,
    this._modelDataSource,
    this._inferenceDataSource,
  );

  /// Initializes the exercise generator and starts the process.
  Future<void> initialize() async {
    _portSubscription = _receivePort.listen(_handleIsolateMessages);
    _learnedWordDataSource.onNewWordAdded.listen(_handleNewWord);

    start();
  }

  /// To be called when the Gemma 3n model has finished downloading.
  @override
  Future<void> onModelDownloaded() async {
    start();
  }

  /// Starts the exercise generation process.
  @override
  Future<void> start() async {
    if (await _modelDataSource.isModelDownloaded()) {
      final allWords = await _learnedWordDataSource.getAllWords();
      // Checking which words have no exercises yet.
      final wordsToProcess = allWords
          .where((word) => word.exerciseCount < ExerciseType.values.length)
          .toList();

      if (wordsToProcess.isNotEmpty) {
        _wordQueue.addAll(wordsToProcess);
        _startIsolateIfNeeded();
      }
    }
  }

  /// Pauses the exercise generation.
  @override
  void pause() {
    if (!_isPaused) {
      _isPaused = true;
      _sendPort?.send({'type': 'pause'});
      AppLogger.d('ExerciseGenerator paused.');
    }
  }

  /// Resumes the exercise generation.
  @override
  void resume() {
    if (_isPaused) {
      _isPaused = false;
      _sendPort?.send({'type': 'resume'});
      AppLogger.d('ExerciseGenerator resumed.');
    }
  }

  /// Cleans up resources used by the generator.
  void dispose() {
    _portSubscription?.cancel();
    _newWordSubscription?.cancel();
    _sendPort?.send({'type': 'stop'});
    _isolate?.kill(priority: Isolate.immediate);
    _isolate = null;
    AppLogger.d('ExerciseGenerator disposed.');
  }

  // --- Private Helper Methods ---

  Future<void> _handleNewWord(LearnedWordDto newWord) async {
    if (await _modelDataSource.isModelDownloaded()) {
      // Only queue the word if it hasn't been processed
      if (newWord.exerciseCount < ExerciseType.values.length &&
          !_wordQueue.any((w) => w.word == newWord.word)) {
        AppLogger.d('New word received: ${newWord.word}. Adding to queue.');
        _wordQueue.add(newWord);
        _startIsolateIfNeeded();
      }
    }
  }

  void _startIsolateIfNeeded() {
    if (_isolate == null && _wordQueue.isNotEmpty) {
      _startIsolate();
    } else if (_wordQueue.isNotEmpty) {
      _sendPort?.send({
        'type': 'add_words',
        'words': _wordQueue.map((w) => w.toJson()).toList(),
      });
      _wordQueue.clear();
    }
  }

  Future<void> _startIsolate() async {
    _isolate = await Isolate.spawn(
      _exerciseGenerationIsolate,
      _receivePort.sendPort,
    );
  }

  Future<void> _handleIsolateMessages(dynamic message) async {
    if (message is SendPort) {
      _sendPort = message;
      // If there are words in the queue from before the isolate was ready, send them.
      if (_wordQueue.isNotEmpty) {
        _sendPort?.send({
          'type': 'add_words',
          'words': _wordQueue.map((w) => w.toJson()).toList(),
        });
        _wordQueue.clear();
      }
      if (_isPaused) {
        _sendPort?.send({'type': 'pause'});
      }
    } else if (message is Map<String, dynamic>) {
      switch (message['type']) {
        case 'generate_exercises_for_word':
          final word = LearnedWordDto.fromJson(message['word']);
          await _generateAndStoreAllExercisesForWord(word);
          break;
        case 'log':
          AppLogger.d('Isolate: ${message['message']}');
          break;
      }
    }
  }

  /// Generates a suite of different exercises for a single learned word.
  Future<void> _generateAndStoreAllExercisesForWord(LearnedWordDto word) async {
    AppLogger.d("Starting exercise generation for word: '${word.word}'");

    // Fetch the latest word status from the database to check generated flags
    final LearnedWordDto? wordFromDb = await _learnedWordDataSource.getWord(
      word.word,
    );

    if (wordFromDb == null) {
      AppLogger.e(
        "Word '${word.word}' not found in database for exercise generation. Skipping.",
      );
      _sendPort?.send({
        'type': 'generation_complete',
      }); // Signal completion for this word
      return;
    }

    int successfullyGeneratedCount = 0;

    // Define which exercise types to generate for each word
    List<ExerciseType> exerciseTypesToGenerate = [];

    // Skipping fillBlank type for now
    if (!wordFromDb.isMatchWordGenerated) {
      exerciseTypesToGenerate.add(ExerciseType.matchWord);
    }
    if (!wordFromDb.isListenChooseGenerated) {
      exerciseTypesToGenerate.add(ExerciseType.listenChoose);
    }
    if (!wordFromDb.isSpellWordGenerated) {
      exerciseTypesToGenerate.add(ExerciseType.spellWord);
    }
    if (!wordFromDb.isSentenceScrambleGenerated) {
      exerciseTypesToGenerate.add(ExerciseType.sentenceScramble);
    }

    exerciseTypesToGenerate.shuffle();

    for (final type in exerciseTypesToGenerate) {
      try {
        final prompt = _generatePromptForExerciseType(
          type: type,
          numberOfExercises: 1, // One exercise per type
          contextWords: [word.word],
        );

        final rawLlmResponse = await _inferenceDataSource.generateText(prompt);

        final List<ExerciseDto> exerciseDtos = _parseExerciseResponse(
          rawLlmResponse,
        );

        if (exerciseDtos.isNotEmpty) {
          final generatedDto = exerciseDtos.first;
          final validatedExerciseDto = ExerciseValidator.correctExerciseDto(
            generatedDto,
          );

          if (validatedExerciseDto != null) {
            final exerciseStoreDto = ExerciseStoreDto(
              exerciseType: type.key,
              jsonContent: jsonEncode(validatedExerciseDto.toJson()),
            );

            await _exerciseStoreDatasource.addExercise(exerciseStoreDto);
            successfullyGeneratedCount++;
            await _updateExerciseGenerationStatus(
              word: word,
              successfullyGeneratedCount: successfullyGeneratedCount,
              successfullyGeneratedTypes: type,
            );
            AppLogger.d(
              "Successfully generated '${type.key}' exercise for '${word.word}'.",
            );
          }
        }
      } catch (e, st) {
        AppLogger.e(
          "Failed to generate '${type.key}' for '${word.word}': $e\n$st",
        );
        // Continue to the next type even if one fails
      }
    }

    // Notify the isolate that this word is done, so it can process the next one.
    _sendPort?.send({'type': 'generation_complete'});
  }

  // Method for updating exercise count and generation flags
  Future<void> _updateExerciseGenerationStatus({
    required LearnedWordDto word,
    required int successfullyGeneratedCount,
    required ExerciseType successfullyGeneratedTypes,
  }) async {
    if (successfullyGeneratedCount > 0) {
      await _learnedWordDataSource.updateExerciseCount(
        word.word,
        successfullyGeneratedCount,
      );
      AppLogger.d(
        "Updated total exercise count for '${word.word}' to $successfullyGeneratedCount.",
      );
    } else {
      AppLogger.d(
        "No new exercises generated for '${word.word}'. Exercise count not updated.",
      );
    }

    // Update individual exercise generation flags
    switch (successfullyGeneratedTypes) {
      case ExerciseType.matchWord:
        await _learnedWordDataSource.updateMatchWordGenerated(word.word, true);
        AppLogger.d("Flagged 'matchWord' as generated for '${word.word}'.");
        break;
      case ExerciseType.listenChoose:
        await _learnedWordDataSource.updateListenChooseGenerated(
          word.word,
          true,
        );
        AppLogger.d("Flagged 'listenChoose' as generated for '${word.word}'.");
        break;
      case ExerciseType.spellWord:
        await _learnedWordDataSource.updateSpellWordGenerated(word.word, true);
        AppLogger.d("Flagged 'spellWord' as generated for '${word.word}'.");
        break;
      case ExerciseType.sentenceScramble:
        await _learnedWordDataSource.updateSentenceScrambleGenerated(
          word.word,
          true,
        );
        AppLogger.d(
          "Flagged 'sentenceScramble' as generated for '${word.word}'.",
        );
        break;
    }
  }

  /// Generates the prompt for Gemma based on the desired exercise type.
  String _generatePromptForExerciseType({
    required ExerciseType type,
    required int numberOfExercises,
    List<String>? contextWords,
  }) {
    // --- Centralized Instructions (Applied to all exercise types) ---
    final baseInstruction =
        '''
    You are a German teacher AI for kids.
    Your task is to generate $numberOfExercises German learning exercises.
    Your output MUST be a single, valid JSON array of objects. Do not output any markdown, comments, or other text outside of the JSON.
  ''';

    final contextInstruction = contextWords != null && contextWords.isNotEmpty
        ? 'Focus on these German words: ${contextWords.join(', ')}.'
        : 'Use common, beginner-level German vocabulary suitable for children.';

    // This will hold the specific instructions for the chosen exercise type.
    String exerciseSpecificInstructions;

    // --- Exercise-Specific Instructions ---
    // Using a "show, don't just tell" approach with a commented JSON schema.
    switch (type) {
      case ExerciseType.matchWord:
        exerciseSpecificInstructions =
            '''
        **Exercise Type: German to English Multiple Choice.**
        **JSON Schema:**
        [
          {
            "${ExerciseConstants.exerciseType}": "${type.key}", // Constant value
            "targetGermanWord": "...", // A beginner-level German word
            "englishOptions": ["...", "...", "..."], // 3-4 English words: 1 correct, others are distractors
            "correctEnglishWord": "..." // The correct English translation
          }
        ]
      ''';
        break;

      case ExerciseType.listenChoose:
        exerciseSpecificInstructions =
            '''
        **Exercise Type: German Word Recognition.**
        **JSON Schema:**
        [
          {
            "${ExerciseConstants.exerciseType}": "${type.key}", // Constant value
            "targetGermanWord": "...", // The German word to identify
            "germanOptions": ["...", "...", "..."], // 3-4 German words: 1 correct, others are similar-sounding/related distractors
            "correctEnglishWord": "..." // English translation of the target word
          }
        ]
      ''';
        break;

      case ExerciseType.spellWord:
        exerciseSpecificInstructions =
            '''
        **Exercise Type: Unscramble German Word.**
        **JSON Schema:**
        [
          {
            "${ExerciseConstants.exerciseType}": "${type.key}", // Constant value
            "targetGermanWord": "...", // The unscrambled German word
            "scrambledLetters": ["...", "...", "..."], // Scrambled letters of the target word plus 1-2 extra distractor letters
            "englishTranslation": "..." // English translation of the target word
          }
        ]
      ''';
        break;

      case ExerciseType.sentenceScramble:
        exerciseSpecificInstructions =
            '''
        **Exercise Type: Unscramble German Sentence.**
        **JSON Schema:**
        [
          {
            "${ExerciseConstants.exerciseType}": "${type.key}", // Constant value
            "targetGermanSentence": "...", // A simple, grammatically correct German sentence
            "englishTranslation": "...", // The English translation of the sentence
            "scrambledWords": ["...", "...", "..."] // The words from the German sentence, in a random order
          }
        ]
      ''';
        break;
    }

    // Combine the parts into the final, optimized prompt.
    return '''
    $baseInstruction
    $contextInstruction
    $exerciseSpecificInstructions
  ''';
  }

  /// Parses the raw JSON string from the LLM.
  List<ExerciseDto> _parseExerciseResponse(String rawJson) {
    // Clean the response to find the JSON array
    final jsonStartIndex = rawJson.indexOf('[');
    final jsonEndIndex = rawJson.lastIndexOf(']');

    if (jsonStartIndex == -1 || jsonEndIndex == -1) {
      throw FormatException('LLM did not return a valid JSON array: $rawJson');
    }

    String jsonArrayString = rawJson.substring(
      jsonStartIndex,
      jsonEndIndex + 1,
    );

    AppLogger.d('Extracted JSON Array for parsing:\n$jsonArrayString');

    List<dynamic> jsonList = json.decode(jsonArrayString);
    return exerciseListDtoFromJson(jsonList);
  }

  /// The entry point for the background isolate.
  static void _exerciseGenerationIsolate(SendPort sendPort) {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    List<Map<String, dynamic>> wordQueue = [];
    bool isPaused = false;
    bool isProcessing = false;

    void triggerGeneration() {
      if (!isPaused && !isProcessing && wordQueue.isNotEmpty) {
        isProcessing = true;
        final word = wordQueue.removeAt(0);
        // Ask the main isolate to perform the generation and storage
        sendPort.send({'type': 'generate_exercises_for_word', 'word': word});
      }
    }

    receivePort.listen((message) {
      if (message is Map<String, dynamic>) {
        switch (message['type']) {
          case 'add_words':
            final words = (message['words'] as List)
                .cast<Map<String, dynamic>>();
            wordQueue.addAll(words);
            triggerGeneration();
            break;
          case 'pause':
            isPaused = true;
            break;
          case 'resume':
            isPaused = false;
            triggerGeneration();
            break;
          case 'generation_complete':
            isProcessing = false;
            triggerGeneration(); // Trigger the next word in the queue
            break;
          case 'stop':
            receivePort.close();
            break;
        }
      }
    });
  }
}
