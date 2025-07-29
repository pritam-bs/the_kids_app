import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/haptics/haptic_service.dart';

@module
abstract class AudioHapticsModule {
  @lazySingleton
  HapticService get hapticService => HapticService();
}
