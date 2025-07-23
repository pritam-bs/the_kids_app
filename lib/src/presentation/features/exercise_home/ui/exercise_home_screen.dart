import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/core/router/app_router.gr.dart';
import 'package:the_kids_app/src/presentation/colors/kids_colors.dart';
import 'package:the_kids_app/src/presentation/features/exercise_home/bloc/exercise_home_bloc.dart';
import 'package:the_kids_app/src/presentation/features/exercise_home/bloc/exercise_home_event.dart';
import 'package:the_kids_app/src/presentation/features/exercise_home/bloc/exercise_home_state.dart';

@RoutePage()
class ExerciseHomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const ExerciseHomeScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ExerciseHomeBloc>()..add(ExerciseHomeEvent.checkModelStatus()),
      child: this,
    );
  }

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
                    content: Text(message),
                    backgroundColor: colorScheme.error,
                  ),
                );
            },
          );
        },
        // BlocBuilder handles rebuilding the UI in response to state changes.
        child: BlocBuilder<ExerciseHomeBloc, ExerciseHomeState>(
          builder: (context, state) {
            return state.when(
              initial: () => const _LoadingUI(message: 'Initializing...'),
              loading: () =>
                  const _LoadingUI(message: 'Checking AI Tutor status...'),
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
                // Downloading progress UI.
                return _DownloadingUI(progress: progress);
              },
              failure: (message) {
                // Error screen with a retry option.
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

/// UI for prompting the user to download the model.
class _DownloadPromptUI extends StatelessWidget {
  const _DownloadPromptUI();

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
              'To enable the smart exercises, please download the AI Tutor Model. This is a one-time download.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                context.read<ExerciseHomeBloc>().add(
                  ExerciseHomeEvent.downloadModelRequested(),
                );
              },
              child: const Text('Download'),
            ),
          ],
        ),
      ),
    );
  }
}

/// UI for download process.
class _DownloadingUI extends StatelessWidget {
  final double progress;

  const _DownloadingUI({required this.progress});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final percentage = (progress * 100).toStringAsFixed(0);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Downloading AI Tutor Model',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: colorScheme.surfaceContainerHighest,
              color: colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text('$percentage% complete', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                context.read<ExerciseHomeBloc>().add(
                  ExerciseHomeEvent.downloadCancelled(),
                );
              },
              child: Text('Cancel', style: TextStyle(color: colorScheme.error)),
            ),
          ],
        ),
      ),
    );
  }
}

/// UI for loading indicator.
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

/// UI for error message with a retry button.
class _ErrorUI extends StatelessWidget {
  final String message;

  const _ErrorUI({required this.message});

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
                  ExerciseHomeEvent.checkModelStatus(),
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

/// The main content of the screen.
class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLargeScreen = screenSize.width > 500;
    final double horizontalPadding = isLargeScreen
        ? screenSize.width * 0.1
        : 16.0;
    final double buttonWidth = isLargeScreen ? 300 : double.infinity;

    final ColorScheme colorScheme = Theme.of(context).colorScheme;

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
              // Welcome Text
              Text(
                'Welcome to Exercise Time!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Here you can practice German words with fun games or read exciting stories!',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Section for Individual Exercises
              Text(
                'Choose an Exercise:',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 20.0, // Horizontal spacing between buttons
                runSpacing: 20.0, // Vertical spacing between rows of buttons
                alignment: WrapAlignment.center,
                children: [
                  // Match the Word
                  _buildExerciseButton(
                    context: context,
                    label: 'Match the Word',
                    icon: Icons.link,
                    onPressed: () {
                      AutoRouter.of(context).push(ExerciseRoute());
                    },
                    buttonWidth: buttonWidth,
                    // Randomly assign a color
                    buttonColor: KidsColors.getRandomKidFriendlyColor(),
                  ),
                  // Listen and Choose
                  _buildExerciseButton(
                    context: context,
                    label: 'Listen and Choose',
                    icon: Icons.hearing,
                    onPressed: () {
                      AutoRouter.of(context).push(ExerciseRoute());
                    },
                    buttonWidth: buttonWidth,
                    buttonColor: KidsColors.getRandomKidFriendlyColor(),
                  ),
                  // Spell the Word
                  _buildExerciseButton(
                    context: context,
                    label: 'Spell the Word',
                    icon: Icons.spellcheck,
                    onPressed: () {
                      AutoRouter.of(context).push(ExerciseRoute());
                    },
                    buttonWidth: buttonWidth,
                    buttonColor: KidsColors.getRandomKidFriendlyColor(),
                  ),
                  // Sentence Scramble (Word Order)
                  _buildExerciseButton(
                    context: context,
                    label: 'Sentence Scramble',
                    icon: Icons.sort_by_alpha,
                    onPressed: () {
                      AutoRouter.of(context).push(ExerciseRoute());
                    },
                    buttonWidth: buttonWidth,
                    buttonColor: KidsColors.getRandomKidFriendlyColor(),
                  ),
                  // Build a Sentence (Guided)
                  _buildExerciseButton(
                    context: context,
                    label: 'Build a Sentence',
                    icon: Icons.text_fields,
                    onPressed: () {
                      AutoRouter.of(context).push(ExerciseRoute());
                    },
                    buttonWidth: buttonWidth,
                    buttonColor: KidsColors.getRandomKidFriendlyColor(),
                  ),
                ],
              ),
              const SizedBox(height: 48),

              // Section for Story
              Text(
                'Explore More:',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
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
                    label: 'Read a Story',
                    icon: Icons.book,
                    onPressed: () {},
                    buttonWidth: buttonWidth,
                    buttonColor: KidsColors.getRandomKidFriendlyColor(),
                  ),
                ],
              ),
              // Add a button to delete the model
              const SizedBox(height: 48),
              TextButton.icon(
                onPressed: () async {
                  final bool? confirmed = await _showDeleteConfirmationDialog(
                    context,
                  );

                  if (confirmed != null && confirmed && context.mounted) {
                    context.read<ExerciseHomeBloc>().add(
                      ExerciseHomeEvent.deleteModelRequested(),
                    );
                  }
                },
                icon: Icon(Icons.delete_forever, color: colorScheme.error),
                label: Text(
                  'Delete AI Tutor Model',
                  style: TextStyle(color: colorScheme.error),
                ),
              ),
              const SizedBox(height: 24), // Spacing at the bottom
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
          shadowColor: buttonColor.withValues(alpha: 0.5),
        ),
      ),
    );
  }

  // A separate function for the model delete confirmation dialog
  Future<bool?> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text(
            'Are you sure you want to delete the AI Tutor Model? Deleting the AI Tutor Model will remove the data necessary for Smart Exercises and the AI tutor functionality. You will need to re-download the model if you wish to use these features again.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
              child: Text(
                'Delete',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          ],
        );
      },
    );
  }
}
