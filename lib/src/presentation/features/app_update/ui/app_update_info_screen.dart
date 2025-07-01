import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/core/router/app_router.gr.dart';
import 'package:the_kids_app/src/domain/entities/app_update/app_update_info_entity.dart';
import 'package:the_kids_app/src/presentation/features/app_update/bloc/app_update_info_bloc.dart';
import 'package:the_kids_app/src/presentation/features/app_update/bloc/app_update_info_event.dart';
import 'package:the_kids_app/src/presentation/features/app_update/bloc/app_update_info_state.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class AppUpdateScreen extends StatelessWidget implements AutoRouteWrapper {
  const AppUpdateScreen({super.key, required this.updateInfo});

  final AppUpdateInfoEntity updateInfo;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<AppUpdateInfoBloc>()
                ..add(OnLoadAppUpdateInfo(appUpdateInfo: updateInfo)),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Update Available')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AppUpdateInfoBloc, AppUpdateInfoState>(
          listener: (context, state) {
            if (state is UpdateSkipped) {
              context.router.root.replace(const HomeRoute());
            }
          },
          builder: (context, state) {
            if (state is UpdateInfo) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Version: ${state.appUpdateInfo.latestVersion}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  if (state.appUpdateInfo.shouldForceUpdate)
                    Text(
                      'This update is mandatory',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    'Release Notes:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(state.appUpdateInfo.releaseNotes),
                  const Spacer(),
                  Row(
                    children: [
                      if (!state.appUpdateInfo.shouldForceUpdate)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              context.read<AppUpdateInfoBloc>().add(
                                OnSkipUpdate(state.appUpdateInfo.latestVersion),
                              );
                            },
                            child: const Text('Skip This Version'),
                          ),
                        ),
                      if (!state.appUpdateInfo.shouldForceUpdate)
                        const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (state.appUpdateInfo.storeUrl != null) {
                              // Open the store URL for the update
                              final Uri storeUrl = Uri.parse(
                                state.appUpdateInfo.storeUrl!,
                              );
                              if (await canLaunchUrl(storeUrl)) {
                                await launchUrl(storeUrl);
                              } else {
                                throw 'Could not launch ${state.appUpdateInfo.storeUrl}';
                              }
                            }
                          },
                          child: const Text('Update Now'),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
