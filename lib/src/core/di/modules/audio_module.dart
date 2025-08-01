import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/audio/sound_service.dart';

@module
abstract class AudioModule {
  @Singleton()
  SoundService get soundService => SoundService();
}
