import 'tts_platform_selector.dart';

abstract class TtsPlatformInterface {
  // Sets up platform-specific event listeners (like voiceschanged for web).
  void addPlatformEventListeners(void Function() onVoicesChanged);

  /// Removes platform-specific event listeners.
  void removePlatformEventListeners();

  factory TtsPlatformInterface() {
    // This factory constructor will return the correct implementation
    // based on the conditional export in tts_platform_selector.dart.
    return TtsPlatformImpl();
  }
}
