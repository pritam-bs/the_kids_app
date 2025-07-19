import 'package:flutter/foundation.dart';
import 'package:the_kids_app/src/core/tts/tts_platform_interface.dart';

class TtsPlatformImpl implements TtsPlatformInterface {
  @override
  void addPlatformEventListeners(void Function() onVoicesChanged) {
    assert(!kIsWeb, 'TtsPlatformImpl is for native platforms only.');
    // No-op for native, as voiceschanged is web-specific.
  }

  @override
  void removePlatformEventListeners() {
    assert(!kIsWeb, 'TtsPlatformImpl is for native platforms only.');
    // No-op for native.
  }
}
