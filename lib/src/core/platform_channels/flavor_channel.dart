import 'package:flutter/services.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';

class FlavorChannel {
  static const MethodChannel _channel = MethodChannel('space.prtlab.the_kids_app/flavor');

  static Future<String?> getFlavor() async {
    try {
      // Call the native method to get the flavor string
      final String? flavor = await _channel.invokeMethod('getFlavor');
      return flavor;
    } on PlatformException catch (e) {
      AppLogger.d("Failed to get flavor: '${e.message}'.");
      return null;
    }
  }
}
