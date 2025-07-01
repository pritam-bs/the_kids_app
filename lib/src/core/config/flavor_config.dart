import 'package:flutter/foundation.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/core/platform_channels/flavor_channel.dart';

enum Flavor { dev, prod }

extension FlavorExtension on Flavor {
  String get name {
    switch (this) {
      case Flavor.dev:
        return 'dev';
      case Flavor.prod:
        return 'prod';
    }
  }
}

class FlavorConfig {
  static final FlavorConfig _instance = FlavorConfig._internal();
  late Flavor _currentFlavor;

  factory FlavorConfig() {
    return _instance;
  }

  FlavorConfig._internal();

  Future<void> load() async {
    String? flavorString;

    if (kIsWeb) {
      // For web, read the flavor from a Dart Define variable
      // The 'WEB_APP_FLAVOR' variable will be passed via --dart-define=WEB_APP_FLAVOR=dev/prod
      flavorString = const String.fromEnvironment(
        'WEB_APP_FLAVOR',
        defaultValue: 'dev',
      );
      AppLogger.i('Web: Detected FLAVOR from --dart-define: $flavorString');
    } else {
      // For native platforms, use the platform channel
      flavorString = await FlavorChannel.getFlavor();
      AppLogger.i('Native: Detected FLAVOR from platform channel: $flavorString');
    }

    _currentFlavor = _getFlavor(flavorString ?? 'dev');
  }

  Flavor _getFlavor(String env) {
    switch (env.toLowerCase()) {
      case 'prod':
        return Flavor.prod;
      case 'dev':
        return Flavor.dev;
      default:
        AppLogger.e('Warning: Unknown flavor string "$env". Defaulting to dev.');
        return Flavor.dev;
    }
  }

  // Flavor access
  Flavor get currentFlavor => _currentFlavor;
  bool get isDev => _currentFlavor == Flavor.dev;
  bool get isProd => _currentFlavor == Flavor.prod;
}
