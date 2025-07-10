import 'package:flutter/material.dart';
import 'package:the_kids_app/src/core/router/app_router.dart';
import 'package:the_kids_app/src/presentation/features/app/app_theme.dart';

class App extends StatelessWidget {
  App({super.key});

  /// create an instance of `AppRouter`
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Home',
      themeMode: ThemeMode.system,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      routerConfig: _appRouter.config(),
    );
  }
}
