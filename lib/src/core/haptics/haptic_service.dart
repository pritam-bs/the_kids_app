import 'package:gaimon/gaimon.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';

class HapticService {
  HapticService() {
    AppLogger.i('HapticService initialized.');
  }

  void playCorrectFeedback() {
    try {
      Gaimon.success();
      AppLogger.d('HapticService: Played correct feedback (light).');
    } catch (e) {
      AppLogger.e('HapticService: Error playing correct feedback: $e');
    }
  }

  void playWrongFeedback() {
    try {
      Gaimon.error();
      AppLogger.d('HapticService: Played wrong feedback (medium).');
    } catch (e) {
      AppLogger.e('HapticService: Error playing wrong feedback: $e');
    }
  }

  void playSelectionFeedback() {
    try {
      Gaimon.selection();
      AppLogger.d('HapticService: Played selection feedback.');
    } catch (e) {
      AppLogger.e('HapticService: Error playing selection feedback: $e');
    }
  }
}
