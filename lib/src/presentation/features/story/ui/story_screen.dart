import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/domain/entities/story/story_entity.dart';
import 'package:the_kids_app/src/presentation/features/story/bloc/story_bloc.dart';
import 'package:the_kids_app/src/presentation/features/story/bloc/story_event.dart';
import 'package:the_kids_app/src/presentation/features/story/bloc/story_state.dart';
import 'package:the_kids_app/src/presentation/widgets/tts/tts_controller.dart';
import 'package:the_kids_app/src/presentation/widgets/tts/tts_widget.dart';

@RoutePage()
class StoryScreen extends StatefulWidget implements AutoRouteWrapper {
  const StoryScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StoryBloc>()..add(LoadStory()),
      child: this,
    );
  }

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late TtsController _ttsController;

  @override
  void initState() {
    super.initState();
    _ttsController = TtsController(languageCode: 'de-DE');
    _ttsController.initialize();
    _ttsController.enableHighlighting(true);
  }

  @override
  void dispose() {
    _ttsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Read a Story',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: colorScheme.primary),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        elevation: 0,
      ),
      body: BlocConsumer<StoryBloc, StoryState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initializing story...')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (story) => _buildLoadedStoryContent(context, story),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 60),
                  const SizedBox(height: 16),
                  Text(
                    'Error: $message',
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<StoryBloc>().add(
                        const StoryEvent.loadStory(),
                      );
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry Load Story'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _buildPlaybackControls(context),
      ),
    );
  }

  Widget _buildLoadedStoryContent(BuildContext context, StoryEntity story) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isLargeScreen = MediaQuery.of(context).size.width > 500;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            // NEW: Changed crossAxisAlignment to CrossAxisAlignment.start
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align children to the left
              children: [
                // NEW: Wrap the title with Center if you want it centered
                Center(
                  child: Text(
                    story.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                      fontSize: isLargeScreen ? 32 : 24,
                    ),
                    textAlign: TextAlign
                        .center, // Text alignment within its own bounds
                  ),
                ),
                const SizedBox(height: 24),
                // REMOVED Align widget, Container will now fill width and align left due to parent Column
                Container(
                  width: double
                      .infinity, // Ensure container takes full width available
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TtsWidget(
                    text: story.content,
                    controller: _ttsController,
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface,
                      height: 1.5,
                      fontSize: isLargeScreen ? 22 : 20,
                    ),
                    highlightedTextStyle: Theme.of(context).textTheme.bodyLarge
                        ?.copyWith(
                          color: colorScheme.primary,
                          height: 1.5,
                          fontSize: isLargeScreen ? 22 : 20,
                        ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaybackControls(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    // Access the current state of the StoryBloc
    final StoryState storyState = context.watch<StoryBloc>().state;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      color: colorScheme.surface,
      child: ListenableBuilder(
        listenable: _ttsController,
        builder: (context, child) {
          final bool ttsIsPlaying = _ttsController.isPlaying;
          final bool ttsIsPaused = _ttsController.isPaused;
          final bool ttsIsStopped = _ttsController.isStopped;
          final bool ttsIsInitialized = _ttsController.isInitialized;

          // Check if the story is loaded before enabling the listen button
          final bool isStoryLoaded = storyState.maybeWhen(
            loaded: (_) => true,
            orElse: () => false,
          );

          return Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.center,
            children: [
              if (!ttsIsPlaying &&
                  (ttsIsStopped || ttsIsPaused) &&
                  ttsIsInitialized)
                _buildControlButton(
                  context,
                  label: ttsIsStopped ? 'Listen' : 'Resume',
                  icon: Icons.play_arrow,
                  onPressed: !isStoryLoaded
                      ? null
                      : () {
                          _ttsController.speak();
                        },
                  color: colorScheme.primary,
                  onColor: colorScheme.onPrimary,
                ),
              if (ttsIsPlaying)
                _buildControlButton(
                  context,
                  label: 'Pause',
                  icon: Icons.pause,
                  onPressed: () {
                    _ttsController.pause();
                  },
                  color: colorScheme.tertiary,
                  onColor: colorScheme.onTertiary,
                ),
              if (!ttsIsStopped && ttsIsInitialized)
                _buildControlButton(
                  context,
                  label: 'Stop',
                  icon: Icons.stop,
                  onPressed: () {
                    _ttsController.stop();
                  },
                  color: colorScheme.error,
                  onColor: colorScheme.onError,
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildControlButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback? onPressed,
    required Color color,
    required Color onColor,
  }) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 600;
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: isLargeScreen ? 30 : 24, color: onColor),
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: isLargeScreen ? 18 : 16,
            color: onColor,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}
