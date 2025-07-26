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
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';

/// Manages the background generation of exercises for learned words.
/// This class integrates prompt generation and response parsing.
class ExerciseGenerator {
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

  ExerciseGenerator(
    this._learnedWordDataSource,
    this._exerciseStoreDatasource,
    this._modelDataSource,
    this._inferenceDataSource,
  );

  /// Initializes the exercise generator and starts the process if conditions are met.
  Future<void> initialize() async {
    _portSubscription = _receivePort.listen(_handleIsolateMessages);
    _learnedWordDataSource.onNewWordAdded.listen(_handleNewWord);

    start();
  }

  /// To be called when the Gemma model has finished downloading.
  Future<void> onModelDownloaded() async {
    start();
  }

  /// Starts the exercise generation process.
  Future<void> start() async {
    if (await _modelDataSource.isModelDownloaded()) {
      final allWords = await _learnedWordDataSource.getAllWords();
      // For this simple check, we'll just see which words have no exercises yet.
      // A more robust check might be needed depending on your exact requirements.
      final wordsToProcess = allWords
          .where((word) => word.exerciseCount == 0)
          .toList();

      if (wordsToProcess.isNotEmpty) {
        _wordQueue.addAll(wordsToProcess);
        _startIsolateIfNeeded();
      }
    }
  }

  /// Pauses the exercise generation.
  void pause() {
    if (!_isPaused) {
      _isPaused = true;
      _sendPort?.send({'type': 'pause'});
      AppLogger.d('ExerciseGenerator paused.');
    }
  }

  /// Resumes the exercise generation.
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

  void _handleNewWord(LearnedWordDto newWord) {
    // Only queue the word if it hasn't been processed
    if (newWord.exerciseCount == 0 &&
        !_wordQueue.any((w) => w.word == newWord.word)) {
      AppLogger.d('New word received: ${newWord.word}. Adding to queue.');
      _wordQueue.add(newWord);
      _startIsolateIfNeeded();
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
      // If there are words in the queue from before the isolate was ready, send them now.
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
    int successfullyGeneratedCount = 0;

    // Define which exercise types to generate for each word
    final exerciseTypesToGenerate = [
      ExerciseType.matchWord,
      ExerciseType.spellWord,
      ExerciseType.listenChoose,
    ];

    for (final type in exerciseTypesToGenerate) {
      try {
        final prompt = _generatePromptForExerciseType(
          type: type,
          numberOfExercises: 1, // We want one exercise of this type
          contextWords: [word.word],
        );

        final rawLlmResponse = await _inferenceDataSource.generateText(prompt);

        final List<ExerciseDto> exerciseDtos = _parseExerciseResponse(
          rawLlmResponse,
        );

        if (exerciseDtos.isNotEmpty) {
          final exerciseDto = exerciseDtos.first; // We only asked for one
          final exerciseStoreDto = ExerciseStoreDto(
            exerciseType: type.key,
            jsonContent: jsonEncode(exerciseDto.toJson()),
          );
          await _exerciseStoreDatasource.addExercise(exerciseStoreDto);
          successfullyGeneratedCount++;
          AppLogger.d(
            "Successfully generated '${type.key}' exercise for '${word.word}'.",
          );
        }
      } catch (e, st) {
        AppLogger.e(
          "Failed to generate '${type.key}' for '${word.word}': $e\n$st",
        );
        // Continue to the next type even if one fails
      }
    }

    if (successfullyGeneratedCount > 0) {
      await _learnedWordDataSource.updateExerciseCount(
        word.word,
        successfullyGeneratedCount,
      );
    }

    // Notify the isolate that this word is done, so it can process the next one.
    _sendPort?.send({'type': 'generation_complete'});
  }

  /// Generates the prompt for Gemma based on the desired exercise type.
  /// (Logic from ExerciseRepositoryImpl)
  String _generatePromptForExerciseType({
    required ExerciseType type,
    required int numberOfExercises,
    List<String>? contextWords,
  }) {
    String basePrompt;
    String exampleJson;
    String exerciseTypeKey = type.key;

    final String contextInstruction =
        contextWords != null && contextWords.isNotEmpty
        ? 'Focus on this German word/concept: ${contextWords.join(', ')}.'
        : 'Use common beginner-level German vocabulary.';

    switch (type) {
      case ExerciseType.matchWord:
        basePrompt =
            'Generate a German-English "match word" exercise. Each exercise should have a German word, three English options, and the correct English translation.';
        exampleJson =
            '''
          {
            "${ExerciseConstants.exerciseType}": "$exerciseTypeKey",
            "targetGermanWord": "Haus",
            "englishOptions": ["house", "cat", "car"],
            "correctEnglishWord": "house"
          }
        ''';
        break;
      case ExerciseType.listenChoose:
        basePrompt =
            'Generate a German "listen and choose" exercise. Each exercise should have a German word and three German word options.';
        exampleJson =
            '''
          {
            "${ExerciseConstants.exerciseType}": "$exerciseTypeKey",
            "targetGermanWord": "Hund",
            "germanOptions": ["Hund", "Katze", "Vogel"]
          }
        ''';
        break;
      case ExerciseType.spellWord:
        basePrompt =
            'Generate a "spell the word" exercise. Each exercise should include a German word, its English translation, and a list of scrambled letters (including some distractors).';
        exampleJson =
            '''
          {
            "${ExerciseConstants.exerciseType}": "$exerciseTypeKey",
            "targetGermanWord": "Apfel",
            "scrambledLetters": ["A", "p", "f", "e", "l", "x", "z"],
            "englishTranslation": "Apple"
          }
        ''';
        break;
      case ExerciseType.sentenceScramble:
        basePrompt =
            'Generate a "sentence scramble" exercise. Each exercise should have a German sentence, its English translation, and a list of scrambled words from the German sentence.';
        exampleJson =
            '''
          {
            "${ExerciseConstants.exerciseType}": "$exerciseTypeKey",
            "targetGermanSentence": "Das ist ein Buch",
            "englishTranslation": "That is a book",
            "scrambledWords": ["ist", "Das", "ein", "Buch"]
          }
        ''';
        break;
      case ExerciseType.fillBlank:
        basePrompt =
            'Generate a "fill in the blanks" exercise. Include a German sentence, its English translation, an array of words, three options for the missing word, and the correct missing word.';
        exampleJson =
            '''
            {
              "${ExerciseConstants.exerciseType}": "$exerciseTypeKey",
              "targetGermanSentence": "Ich habe einen Hund",
              "englishTranslation": "I have a dog",
              "sentenceWithMissingWord": ["Ich", "habe", "einen", ""],
              "optionsForMissingWord": ["Katze", "Vogel", "Hund"],
              "correctAnswerWord": "Hund"
            }
            ''';
    }

    return '''
        You are an expert in German-English vocabulary and exercise generation for kids.
        Instruction:
        - $basePrompt
        - Generate exactly $numberOfExercises exercises.
        - $contextInstruction
        - Difficulty: Beginner to Intermediate.
        - IMPORTANT: Your output MUST be a single, valid JSON array of objects. Each object in the array MUST contain the "exerciseType" field set to "$exerciseTypeKey". Do NOT include any text, explanation, or markdown.
        
        JSON Object Example:
        $exampleJson
        ''';
  }

  /// Parses the raw JSON string from the LLM.
  /// (Logic from ExerciseRepositoryImpl)
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
