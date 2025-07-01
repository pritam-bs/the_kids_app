import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/core/router/app_router.gr.dart';
import 'package:the_kids_app/src/presentation/features/splash/bloc/app_update/app_update_check_bloc.dart';
import 'package:the_kids_app/src/presentation/features/splash/bloc/app_update/app_update_check_event.dart';
import 'package:the_kids_app/src/presentation/features/splash/bloc/app_update/app_update_check_state.dart';
import 'package:the_kids_app/src/presentation/widgets/initial_load_error_view_widget.dart';

@RoutePage()
class SplashScreen extends StatelessWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (context) => getIt<AppUpdateCheckBloc>()..add(const CheckForUpdate()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppUpdateCheckBloc, AppUpdateCheckState>(
      listener: (context, state) {
        switch (state) {
          case Initial():
            context.read<AppUpdateCheckBloc>().add(const CheckForUpdate());
          case UpToDate():
          case UpdateSkipped():
            // App is up to date or update was skipped
            // When up to date or skipped, check auth state to determine next screen
            context.router.root.replace(const HomeRoute());
            break;
          case UpdateAvailable(appUpdateInfo: final info):
            context.router.root.replace(AppUpdateRoute(updateInfo: info));
            break;
          case Error():
            break;
        }
      },
      builder: (context, state) {
        if (state is Error) {
          return InitialLoadErrorView(message: state.message, onRetry: onRetry);
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //TODO Replace with app logo
                const FlutterLogo(size: 100),
                const SizedBox(height: 20),
                // Loading indicator
                const CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }

  void onRetry(BuildContext context) {
    context.read<AppUpdateCheckBloc>().add(const Initialize());
  }
}
