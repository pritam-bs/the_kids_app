import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/core/router/app_router.gr.dart';
import 'package:the_kids_app/src/presentation/colors/kids_colors.dart';
import 'package:the_kids_app/src/presentation/features/exercise_home/bloc/exercise_home_bloc.dart';
import 'package:the_kids_app/src/presentation/features/exercise_home/bloc/exercise_home_event.dart';
import 'package:the_kids_app/src/presentation/features/exercise_home/bloc/exercise_home_state.dart';

// Define the model file name as a constant for easy access and modification.

@RoutePage()
class ExerciseHomeScreen extends StatelessWidget {
  ExerciseHomeScreen({super.key});
  final String _modelFileName = getIt<String>(instanceName: 'gemma-3n-E2B');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExerciseHomeBloc>()
        ..add(
          ExerciseHomeEvent.checkModelStatus(
            modelFileName: _modelFileName,
          ),
        ),
      child: const _ExerciseHomeView(),
    );
  }
}

class _ExerciseHomeView extends StatelessWidget {
  const _ExerciseHomeView();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exercise Time!',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: colorScheme.primary),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        elevation: 0,
      ),
      body: BlocListener<ExerciseHomeBloc, ExerciseHomeState>(
        listener: (context, state) {
          state.whenOrNull(
            failure: (message) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text('Error: $message'),
                    backgroundColor: colorScheme.error,
                  ),
                );
            },
          );
        },
        // BlocBuilder handles rebuilding the UI in response to state changes.
        child: BlocBuilder<ExerciseHomeBloc, ExerciseHomeState>(
          builder: (context, state) {
            // The `when` method from freezed ensures we handle every possible state,
            // preventing runtime errors and making the logic clear.
            return state.when(
              initial: () => const _LoadingUI(message: 'Initializing...'),
              loading: () =>
                  const _LoadingUI(message: 'Checking model status...'),
              modelInfoReady: (modelInfo) {
                if (modelInfo.isDownloaded) {
                  // If the model is ready, show the main screen content.
                  return _MainContent();
                } else {
                  // If the model is not downloaded, prompt the user.
                  return _DownloadPromptUI();
                }
              },
              downloading: (progress) {
                // Show a detailed downloading progress UI.
                return _DownloadingUI(progress: progress);
              },
              failure: (message) {
                // Show a clear error screen with a retry option.
                return _ErrorUI(message: message);
              },
            );
          },
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Helper Widgets for different UI states
// -----------------------------------------------------------------------------

/// UI shown when prompting the user to download the model.
class _DownloadPromptUI extends StatelessWidget {
  _DownloadPromptUI();
  final String _modelFileName = getIt<String>(instanceName: 'gemma-3n-E2B');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_download_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            const Text(
              'Additional Setup Required',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'To enable the smart exercises, please download the AI model. This is a one-time download.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                context.read<ExerciseHomeBloc>().add(
                  ExerciseHomeEvent.downloadModelRequested(
                    modelFileName: _modelFileName,
                  ),
                );
              },
              child: const Text('Download Model'),
            ),
          ],
        ),
      ),
    );
  }
}

/// UI shown during the download process.
class _DownloadingUI extends StatelessWidget {
  final double progress;
  final String _modelFileName = getIt<String>(instanceName: 'gemma-3n-E2B');
  _DownloadingUI({required this.progress});

  @override
  Widget build(BuildContext context) {
    final percentage = (progress * 100).toStringAsFixed(0);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Downloading AI Model',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 16),
            Text('$percentage% complete', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () {
                context.read<ExerciseHomeBloc>().add(
                  ExerciseHomeEvent.downloadCancelled(
                    modelFileName: _modelFileName,
                  ),
                );
              },
              child: const Text(
                'Cancel Download',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// UI for displaying a generic loading indicator.
class _LoadingUI extends StatelessWidget {
  final String message;
  const _LoadingUI({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(message),
        ],
      ),
    );
  }
}

/// UI for displaying an error message with a retry button.
class _ErrorUI extends StatelessWidget {
  final String message;
  final String _modelFileName = getIt<String>(instanceName: 'gemma-3n-E2B');
  _ErrorUI({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 60,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            const Text(
              'Something Went Wrong',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.read<ExerciseHomeBloc>().add(
                  ExerciseHomeEvent.checkModelStatus(
                    modelFileName: _modelFileName,
                  ),
                );
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

/// The main content of the screen, which is your original UI.
class _MainContent extends StatelessWidget {
  final String _modelFileName = getIt<String>(instanceName: 'gemma-3n-E2B');
  _MainContent();

  @override
  Widget build(BuildContext context) {
    // This is your original UI layout.
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLargeScreen = screenSize.width > 500;
    final double horizontalPadding = isLargeScreen
        ? screenSize.width * 0.1
        : 16.0;
    final double buttonWidth = isLargeScreen ? 300 : double.infinity;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 24.0,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to Exercise Time!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Text(
                'Choose an Exercise:',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.center,
                children: [
                  _buildExerciseButton(
                    context: context,
                    label: 'Match the Word',
                    icon: Icons.link,
                    onPressed: () =>
                        AutoRouter.of(context).push(ExerciseRoute()),
                    buttonWidth: buttonWidth,
                    buttonColor: KidsColors.getRandomKidFriendlyColor(),
                  ),
                  _buildExerciseButton(
                    context: context,
                    label: 'Listen and Choose',
                    icon: Icons.hearing,
                    onPressed: () =>
                        AutoRouter.of(context).push(ExerciseRoute()),
                    buttonWidth: buttonWidth,
                    buttonColor: KidsColors.getRandomKidFriendlyColor(),
                  ),
                  _buildExerciseButton(
                    context: context,
                    label: 'Read a Story',
                    icon: Icons.book,
                    onPressed: () {},
                    buttonWidth: buttonWidth,
                    buttonColor: KidsColors.getRandomKidFriendlyColor(),
                  ),
                ],
              ),
              // Optional: Add a button to delete the model for testing purposes
              const SizedBox(height: 48),
              TextButton.icon(
                onPressed: () {
                  context.read<ExerciseHomeBloc>().add(
                    ExerciseHomeEvent.deleteModelRequested(
                      modelFileName: _modelFileName,
                    ),
                  );
                },
                icon: const Icon(Icons.delete_forever, color: Colors.grey),
                label: const Text(
                  'Delete AI Model (for testing)',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required double buttonWidth,
    required Color buttonColor,
  }) {
    const Color onButtonColor = Colors.black;

    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 40, color: onButtonColor),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: onButtonColor,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          shadowColor: buttonColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
