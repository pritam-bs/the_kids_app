import 'dart:js_interop';
import 'package:flutter/foundation.dart';
import 'package:the_kids_app/src/core/tts/tts_platform_interface.dart';

@JS()
@staticInterop
class SpeechSynthesis {}

extension SpeechSynthesisExtension on SpeechSynthesis {
  external set onvoiceschanged(JSFunction listener);
  external JSVoid addEventListener(JSString type, JSFunction listener);
  external JSVoid removeEventListener(JSString type, JSFunction listener);
}

extension type JSWindow._(JSObject _) implements JSObject {
  external SpeechSynthesis get speechSynthesis;
}

@JS()
external JSWindow get window;

// Web implementation of TtsPlatformInterface using dart:js_interop.
class TtsPlatformImpl implements TtsPlatformInterface {
  JSFunction? _voicesChangedInteropCallback; // Store the JS function reference

  @override
  void addPlatformEventListeners(void Function() onVoicesChanged) {
    assert(kIsWeb, 'This implementation is for web platform only.');
    _voicesChangedInteropCallback ??= onVoicesChanged.toJS;
    window.speechSynthesis.addEventListener(
      'voiceschanged'.toJS,
      _voicesChangedInteropCallback!,
    );
  }

  @override
  void removePlatformEventListeners() {
    assert(kIsWeb, 'This implementation is for web platform only.');
    if (_voicesChangedInteropCallback != null) {
      window.speechSynthesis.removeEventListener(
        'voiceschanged'.toJS,
        _voicesChangedInteropCallback!,
      );
      _voicesChangedInteropCallback = null;
    }
  }
}
