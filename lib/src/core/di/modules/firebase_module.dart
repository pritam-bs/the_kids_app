import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';

@module
abstract class FirebaseModule {
  @preResolve
  Future<FirebaseApp> get firebaseApp async {
    final app = await Firebase.initializeApp();
    AppLogger.d('🚀 Firebase initialized');

    if (kDebugMode) {
      AppLogger.d('🐛 Running in debug mode.');
    }

    return app;
  }
}
