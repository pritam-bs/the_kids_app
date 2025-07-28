import 'dart:convert';
import 'dart:math';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/data/datasources/llm_inference/inference_data_source.dart';
import 'package:the_kids_app/src/data/datasources/story/story_data_source.dart';
import 'package:the_kids_app/src/data/datasources/story/story_topic.dart';
import 'package:the_kids_app/src/data/dtos/story/story_dto.dart';

class StoryDataSourceImpl implements StoryDataSource {
  final InferenceDataSource _inferenceDataSource;

  StoryDataSourceImpl(this._inferenceDataSource);

  @override
  Future<StoryDto> fetchStory() async {
    AppLogger.d('DataSource: Fetching new story using Gemma.');

    final random = Random();
    final StoryTopic randomTopic =
        StoryTopic.values[random.nextInt(StoryTopic.values.length)];

    final String prompt = _generateStoryPrompt(randomTopic);

    // Call Gemma with the JSON-formatted prompt
    final String jsonResponse = await _inferenceDataSource.generateText(prompt);

    try {
      final storyDto = _parseStoryResponse(jsonResponse);

      return storyDto;
    } on FormatException catch (e) {
      AppLogger.e('Failed to parse JSON from Gemma: $e');
      throw Exception('LLM returned malformed JSON: ${e.toString()}');
    } catch (e) {
      AppLogger.e('An unexpected error occurred: $e');
      rethrow;
    }
  }

  StoryDto _parseStoryResponse(String rawJson) {
    // Clean the response to find the JSON array
    final jsonStartIndex = rawJson.indexOf('{');
    final jsonEndIndex = rawJson.lastIndexOf('}');

    if (jsonStartIndex == -1 || jsonEndIndex == -1) {
      throw FormatException('LLM did not return a valid JSON array: $rawJson');
    }

    String jsonString = rawJson.substring(jsonStartIndex, jsonEndIndex + 1);

    AppLogger.d('Extracted JSON Array for parsing:\n$jsonString');

    Map<String, dynamic> data = json.decode(jsonString);
    return StoryDto.fromJson(data);
  }

  String _generateStoryPrompt(StoryTopic topic) {
    const String exampleJson = '''
      {
        "titleGerman": "Der Hase",
        "contentGerman": "Ein kleiner Hase suchte eine Karotte. Er fand eine große Karotte.",
        "titleEnglish": "The Rabbit",
        "contentEnglish": "A little rabbit looked for a carrot. He found a big carrot."
      }
    ''';

    return '''
      You are an expert in German-English children's story generation.
      Instruction:
      - Generate a short, simple children's story in German, along with its English translation.
      - The story should be about ${topic.description}
      - Difficulty: Beginner German vocabulary.
      - IMPORTANT: Your output MUST be a single, valid JSON object. Do NOT include any text, explanation, or markdown outside the JSON.
      - Output JSON structure: {"titleGerman": "", "contentGerman": "", "titleEnglish": "", "contentEnglish": ""}
      - Ensure all string values within the JSON are properly escaped for JSON format. Specifically, double quotes inside the string values (e.g., in dialogue) MUST be escaped with a backslash (\\").

      JSON Object Example:
      $exampleJson
    ''';
  }
}
