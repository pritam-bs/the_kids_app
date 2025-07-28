import 'dart:async';

import 'package:flutter_gemma/core/model.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:flutter_gemma/pigeon.g.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/data/datasources/llm_inference/inference_data_source.dart';
import 'package:the_kids_app/src/data/datasources/llm_model/mdel_data_source.dart';

class GemmaInferenceDataSource implements InferenceDataSource {
  final ModelDataSource _modelDataSource;
  InferenceModel? _gemmaInference;
  Completer<void>? _lock;

  GemmaInferenceDataSource(this._modelDataSource);

  Future<InferenceModel> _getGemmaInference() async {
    if (_gemmaInference != null) {
      return _gemmaInference!;
    }

    final gemma = FlutterGemmaPlugin.instance;
    final path = await _modelDataSource.getLocalPath();

    await gemma.modelManager.setModelPath(path);

    _gemmaInference = await gemma.createModel(
      modelType: ModelType.gemmaIt,
      preferredBackend: PreferredBackend.cpu,
      maxTokens: 2048,
      supportImage: false,
    );

    return _gemmaInference!;
  }

  @override
  Future<String> generateText(String prompt) async {
    // Acquire the lock
    while (_lock != null) {
      AppLogger.d('Waiting for previous Gemma session to complete...');
      // Wait until the previous operation completes
      await _lock!.future; 
    }
    // Set the lock
    _lock = Completer<void>(); 

    try {
      final gemmaInference = await _getGemmaInference();
      final gemmaSession = await gemmaInference.createSession(
        temperature: 1.0,
        randomSeed: 0,
        topK: 32,
        topP: 0.50,
      );

      AppLogger.d('Gemma Raw Prompt:\n$prompt');

      // Add the prompt to the session as a user message
      await gemmaSession.addQueryChunk(
        Message.text(text: prompt, isUser: true),
      );

      // Get the raw response from Gemma
      String rawResponse = await gemmaSession.getResponse();

      AppLogger.d('Gemma Raw Response:\n$rawResponse');

      await gemmaSession.close();

      return rawResponse;
    } catch (e, st) {
      AppLogger.e('Error during Gemma inference: $e\n$st');
      // Re-throw the error
      throw Exception('Failed to get raw text from LLM: $e');
    } finally {
      // Release the lock
      _lock?.complete();
      _lock = null;
    }
  }
}
