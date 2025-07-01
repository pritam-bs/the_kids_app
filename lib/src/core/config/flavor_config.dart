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
    final flavorString = await FlavorChannel.getFlavor();
    _currentFlavor = _getFlavor(flavorString ?? 'dev');
  }

  Flavor _getFlavor(String env) {
    switch (env) {
      case 'prod':
        return Flavor.prod;
      default:
        return Flavor.dev;
    }
  }

  // Flavor access
  Flavor get currentFlavor => _currentFlavor;
  bool get isDev => _currentFlavor == Flavor.dev;
  bool get isProd => _currentFlavor == Flavor.prod;
}
