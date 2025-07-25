import 'dart:convert';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/data/datasources/llm_inference/inference_data_source.dart';
import 'package:the_kids_app/src/data/dtos/exercise/exercise_dto.dart';
import 'package:the_kids_app/src/data/mappers/exercise/exercise_mapper.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';
import 'package:the_kids_app/src/domain/repositories/exercise/exercise_repository.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final InferenceDataSource _inferenceDataSource;

  ExerciseRepositoryImpl(this._inferenceDataSource);

  String _getExerciseTypeKey(ExerciseType type) {
    // Helper to get the string key for the Freezed union
    switch (type) {
      case ExerciseType.matchWord:
        return 'matchWord';
      case ExerciseType.listenChoose:
        return 'listenChoose';
      case ExerciseType.spellWord:
        return 'spellWord';
      case ExerciseType.sentenceScramble:
        return 'sentenceScramble';
      case ExerciseType.fillBlank:
        return 'fillBlank';
    }
  }

  String _generatePromptForExerciseType({
    required ExerciseType type,
    required int numberOfExercises,
    List<String>? contextWords,
  }) {
    String basePrompt;
    String exampleJson;
    String exerciseTypeKey = _getExerciseTypeKey(type);

    // Context string for the prompt
    final String contextInstruction =
        contextWords != null && contextWords.isNotEmpty
        ? 'Focus on these German words/concepts: ${contextWords.join(', ')}.'
        : 'Use common beginner-level German vocabulary.';

    // Define the prompt and example JSON structure for each exercise type
    switch (type) {
      case ExerciseType.matchWord:
        basePrompt =
            'Generate a German-English "match word" exercise. Each exercise should have a German word, three English options, and the correct English translation.';
        exampleJson =
            '''
          {
            "exerciseType": "$exerciseTypeKey",
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
            "exerciseType": "$exerciseTypeKey",
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
            "exerciseType": "$exerciseTypeKey",
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
            "exerciseType": "$exerciseTypeKey",
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
              "exerciseType": "$exerciseTypeKey",
              "targetGermanSentence": "Ich habe einen Hund",
              "englishTranslation": "I have a dog",
              "sentenceWithMissingWord": ["Ich", "habe", "einen", ""],
              "optionsForMissingWord": ["Katze", "Vogel", "Hund"],
              "correctAnswerWord": "Hund"
            }
            ''';
    }

    final fullPrompt =
        '''
        You are an expert in German-English vocabulary and exercise generation for kids.
        Instruction:
        - $basePrompt
        - Generate exactly $numberOfExercises exercises
        - $contextInstruction
        - Difficulty: Beginner to Intermediate.
        - IMPORTANT: Your output MUST be a single, valid JSON array of objects. Each object in the array MUST contain the "exerciseType" field set to "$exerciseTypeKey" Do NOT include any text, explanation, or markdown
        
        JSON Object Example:
        $exampleJson
        ''';
    return fullPrompt;
  }

  List<ExerciseDto> _parseExerciseResponse(String rawJson, ExerciseType type) {
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

  @override
  Future<List<ExerciseEntity>> generateExercises({
    required ExerciseType type,
    required int numberOfExercises,
    List<String>? contextWords,
  }) async {
    try {
      final prompt = _generatePromptForExerciseType(
        type: type,
        numberOfExercises: numberOfExercises,
        contextWords: contextWords,
      );

      final rawLlmResponse = await _inferenceDataSource.generateText(prompt);

      // Parse the raw response into a list of DTOs
      final List<ExerciseDto> exerciseDtos = _parseExerciseResponse(
        rawLlmResponse,
        type,
      );

      // Map DTOs to domain entities using the extension
      return exerciseDtos.toEntityList();
    } catch (e, st) {
      AppLogger.e('Error in ExerciseRepositoryImpl: $e\n$st');
      throw Exception('Failed to generate and parse exercises from LLM: $e');
    }
  }
}
