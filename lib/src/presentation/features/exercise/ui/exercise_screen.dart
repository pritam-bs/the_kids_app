import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_kids_app/src/core/audio/sound_service.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/core/haptics/haptic_service.dart';
import 'package:the_kids_app/src/core/router/app_router.gr.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/presentation/features/exercise/bloc/exercise_bloc.dart';
import 'package:the_kids_app/src/presentation/features/exercise/bloc/exercise_event.dart';
import 'package:the_kids_app/src/presentation/features/exercise/bloc/exercise_state.dart';
import 'package:the_kids_app/src/presentation/features/exercise/ui/exercise_card_widgets/match_word_exercise_card.dart';
import 'package:the_kids_app/src/presentation/features/exercise/ui/exercise_card_widgets/sentence_scramble_exercise_card.dart';
import 'package:the_kids_app/src/presentation/features/exercise/ui/exercise_card_widgets/spell_word_exercise_card.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';
import 'package:the_kids_app/src/presentation/features/exercise/ui/answer_feedback_overlay.dart';
import 'package:the_kids_app/src/presentation/features/exercise/ui/exercise_card_widgets/listen_choose_exercise_card.dart';
import 'package:the_kids_app/src/presentation/features/exercise/ui/exercise_result_widget.dart';

@RoutePage()
class ExerciseScreen extends StatelessWidget implements AutoRouteWrapper {
  final ExerciseType type;
  final SoundService _soundService = getIt<SoundService>();
  final _hapticService = getIt<HapticService>();
  ExerciseScreen({super.key, required this.type});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ExerciseBloc>()
            ..add(ExerciseEvent.initializeExercises(exerciseType: type)),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Practice Time!',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: BlocBuilder<ExerciseBloc, ExerciseState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(
              child: Text(
                'Error: $message',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
                textAlign: TextAlign.center,
              ),
            ),
            loaded:
                (
                  exercises,
                  currentIndex,
                  lastAnswerCorrect,
                  feedbackAnimationTrigger,
                ) {
                  // Get new state fields
                  if (exercises.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lightbulb_outline,
                              color: Theme.of(context).colorScheme.primary,
                              size: 60,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              "Let's learn some new words first! ✨\n\n"
                              "The exercises will magically appear here as you discover more words!",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                    height: 1.5,
                                  ),
                            ),
                            const SizedBox(height: 32),
                            ElevatedButton.icon(
                              onPressed: () {
                                AutoRouter.of(context).popUntil(
                                  (route) =>
                                      route.settings.name ==
                                      CategorySelectionRoute.name,
                                );
                              },
                              icon: const Icon(Icons.arrow_back),
                              label: const Text('Back to Learning'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.secondary,
                                foregroundColor: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Stack(
                    // Use Stack to layer content and animation
                    children: [
                      // Main Exercise Carousel Content
                      _buildExerciseCarousel(context, exercises, currentIndex),

                      // Animation Overlay
                      // Only show if feedback is available
                      if (lastAnswerCorrect != null)
                        IgnorePointer(
                          // Prevents interaction with elements behind the overlay
                          child: AnimatedOpacity(
                            opacity: 1.0,
                            duration: const Duration(milliseconds: 300),
                            child: AnswerFeedbackOverlay(
                              isCorrect: lastAnswerCorrect,
                              animationTrigger: feedbackAnimationTrigger,
                              onAnimationComplete: () {
                                context.read<ExerciseBloc>().add(
                                  const ExerciseEvent.clearAnswerFeedback(),
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  );
                },
            sessionCompleted:
                (
                  int correctAnswers,
                  int wrongAnswers,
                  int skippedQuestions,
                  int totalQuestions,
                ) {
                  return ExerciseResultView(
                    correctAnswers: correctAnswers,
                    wrongAnswers: wrongAnswers,
                    skippedQuestions: skippedQuestions,
                    totalQuestions: totalQuestions,
                  );
                },
          );
        },
      ),
    );
  }

  Widget _buildExerciseCarousel(
    BuildContext context,
    List<ExerciseEntity> exercises,
    int currentIndex,
  ) {
    final PageController pageController = PageController(
      initialPage: currentIndex,
    );
    final bool isLargeScreen = MediaQuery.of(context).size.width > 500;
    final double cardMaxWidth = isLargeScreen ? 500 : double.infinity;
    final double horizontalPadding = isLargeScreen
        ? (MediaQuery.of(context).size.width - cardMaxWidth) / 2
        : 0.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 8.0,
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                width: cardMaxWidth,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: exercises.length,
                  onPageChanged: (index) {
                    context.read<ExerciseBloc>().add(
                      ExerciseEvent.changeExercise(index),
                    );
                  },
                  itemBuilder: (context, index) {
                    final exerciseEntity = exercises[index];
                    // Define the callback to dispatch an event to the Bloc
                    void onAnswerSubmitted(
                      bool isCorrect,
                      ExerciseType type,
                    ) async {
                      if (isCorrect) {
                        _hapticService.playCorrectFeedback();
                        _soundService.playCorrectSound();
                      } else {
                        _hapticService.playWrongFeedback();
                        _soundService.playWrongSound();
                      }

                      if (context.mounted) {
                        context.read<ExerciseBloc>().add(
                          ExerciseEvent.exerciseAnswered(
                            isCorrect: isCorrect,
                            exerciseType: type,
                          ),
                        );
                      }
                    }

                    // Pass the callback to all exercise cards
                    switch (exerciseEntity) {
                      case MatchWordExerciseEntity():
                        return MatchWordExerciseCard(
                          data: exerciseEntity,
                          onAnswerSubmitted: onAnswerSubmitted,
                        );
                      case ListenChooseExerciseEntity():
                        return ListenChooseExerciseCard(
                          data: exerciseEntity,
                          onAnswerSubmitted: onAnswerSubmitted,
                        );
                      case SpellWordExerciseEntity():
                        return SpellWordExerciseCard(
                          data: exerciseEntity,
                          onAnswerSubmitted: onAnswerSubmitted,
                        );
                      case SentenceScrambleExerciseEntity():
                        return SentenceScrambleExerciseCard(
                          data: exerciseEntity,
                          onAnswerSubmitted: onAnswerSubmitted,
                        );
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: currentIndex > 0
                      ? () {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        }
                      : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: isLargeScreen ? 30 : 20,
                      vertical: isLargeScreen ? 15 : 12,
                    ),
                    textStyle: TextStyle(fontSize: isLargeScreen ? 18 : 14),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: currentIndex < exercises.length - 1
                      ? () {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        }
                      : () {
                          context.read<ExerciseBloc>().add(
                            const ExerciseEvent.showResult(),
                          );
                        },
                  icon: const Icon(Icons.arrow_forward),
                  iconAlignment: IconAlignment.end,
                  label: const Text('Next'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: isLargeScreen ? 30 : 20,
                      vertical: isLargeScreen ? 15 : 12,
                    ),
                    textStyle: TextStyle(fontSize: isLargeScreen ? 18 : 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
