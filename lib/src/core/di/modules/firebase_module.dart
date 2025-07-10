import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/flavor_config.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/core/config/firebase_options_dev.dart' as dev;
import 'package:the_kids_app/src/core/config/firebase_options_prod.dart'
    as prod;

@module
abstract class FirebaseModule {
  @preResolve
  Future<FirebaseApp> get firebaseApp async {
    final appFlavor = FlavorConfig().currentFlavor;

    final firebaseOptions = switch (appFlavor) {
      Flavor.dev => dev.DefaultFirebaseOptions.currentPlatform,
      Flavor.prod => prod.DefaultFirebaseOptions.currentPlatform,
    };

    AppLogger.i('Initializing Firebase with options for $appFlavor flavor');
    final app = await Firebase.initializeApp(options: firebaseOptions);
    AppLogger.i('🚀 Firebase initialized');

    return app;
  }

  @preResolve
  Future<FirebaseRemoteConfig> get firebaseRemoteConfig async {
    AppLogger.i('Initializing Firebase Remote Config');
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: Duration(hours: 6),
      ),
    );
    return remoteConfig;
  }
}
