import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:the_kids_app/src/core/router/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  /// create an instance of `AppRouter`
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Home',
      themeMode: ThemeMode.system,
      theme: FlexThemeData.light(scheme: FlexScheme.blueM3),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueM3),
      routerConfig: _appRouter.config(),
    );
  }
}
