import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/presentation/features/home/bloc/home_bloc.dart';
import 'package:the_kids_app/src/presentation/features/home/bloc/home_event.dart';
import 'package:the_kids_app/src/presentation/features/home/bloc/home_state.dart';
import 'package:the_kids_app/src/presentation/widgets/initial_load_error_view_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(const Initialize()),
      child: this,
    );
  }

  @override
  Widget build(Object context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        if (state is Error) {
          return InitialLoadErrorView(message: state.message, onRetry: onRetry);
        }

        return Scaffold(body: Center(child: Text("Home Screen")));
      },
    );
  }

  void onRetry(BuildContext context) {
    context.read<HomeBloc>().add(const Initialize());
  }
}
