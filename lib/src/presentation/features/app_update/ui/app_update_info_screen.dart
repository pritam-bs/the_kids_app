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
      create: (context) =>
          getIt<AppUpdateInfoBloc>()
            ..add(OnLoadAppUpdateInfo(appUpdateInfo: updateInfo)),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocConsumer<AppUpdateInfoBloc, AppUpdateInfoState>(
        listener: (context, state) {
          if (state is UpdateSkipped) {
            context.router.root.replace(const HomeRoute());
          }
        },
        builder: (context, state) {
          if (state is UpdateInfo) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.system_update_alt,
                      size: 100,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 24),

                    // --- Title ---
                    Text(
                      'New Update Available!',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    // --- Version Info ---
                    Text(
                      'Version: ${state.appUpdateInfo.latestVersion}',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // --- Mandatory Update Warning ---
                    if (state.appUpdateInfo.shouldForceUpdate)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.errorContainer,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: theme.colorScheme.error,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.warning_rounded,
                              color: theme.colorScheme.onErrorContainer,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Flexible(
                              child: Text(
                                'This update is mandatory to continue using the app.',
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: theme.colorScheme.onErrorContainer,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 24),

                    // --- Release Notes ---
                    Text(
                      'What\'s New:',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      // Makes release notes scrollable if they are long
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          state.appUpdateInfo.releaseNotes,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign
                              .center, // Center align for better aesthetics
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // --- Action Buttons ---
                    Row(
                      children: [
                        if (!state.appUpdateInfo.shouldForceUpdate)
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                context.read<AppUpdateInfoBloc>().add(
                                  OnSkipUpdate(
                                    state.appUpdateInfo.latestVersion,
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: theme.colorScheme.onSurface,
                                side: BorderSide(
                                  color: theme.colorScheme.outline,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text('Skip This Version'),
                            ),
                          ),
                        if (!state.appUpdateInfo.shouldForceUpdate)
                          const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (state.appUpdateInfo.storeUrl != null) {
                                final Uri storeUrl = Uri.parse(
                                  state.appUpdateInfo.storeUrl!,
                                );
                                if (await canLaunchUrl(storeUrl)) {
                                  await launchUrl(storeUrl);
                                } else {
                                  if (!context.mounted) {
                                    return;
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Could not open store link: ${state.appUpdateInfo.storeUrl}',
                                      ),
                                      backgroundColor: theme.colorScheme.error,
                                    ),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: theme.colorScheme.onPrimary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                            ),
                            child: const Text(
                              'Update Now',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Loading indicator
                  const CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
