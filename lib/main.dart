import 'package:flutter/material.dart';
import 'package:the_kids_app/src/core/config/flavor_config.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/presentation/features/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlavorConfig().load();

  await configureDependencies();

  runApp(App());
}
