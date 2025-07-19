import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/tts/tts_service.dart';

@module
abstract class TtsModule {
  @preResolve
  Future<TtsService> get ttsService async {
    final ttsService = TtsService();
    ttsService.initialize();

    return ttsService;
  }
}
