import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:the_kids_app/src/core/router/app_router.gr.dart';

class ExerciseResultView extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;
  final int skippedQuestions;
  final int totalQuestions;

  const ExerciseResultView({
    super.key,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.skippedQuestions,
    required this.totalQuestions,
  });

  // Determine motivational title based on performance
  String _getMotivationalTitle(BuildContext context) {
    final double percentageCorrect = (correctAnswers / totalQuestions) * 100;

    if (percentageCorrect >= 80) {
      return 'Wow, Well done! 🎉';
    } else if (percentageCorrect >= 50) {
      return 'Great job! Keep it up! ✨';
    } else if (correctAnswers > 0) {
      return 'Almost there! You can do it! 💪';
    } else {
      return 'Don\'t give up! Try again! 🌈';
    }
  }

  // Determine Lottie animation URL based on performance
  String _getLottieAssetName() {
    final double percentageCorrect = (correctAnswers / totalQuestions) * 100;

    if (percentageCorrect >= 80) {
      return 'assets/lottie/confetti_wow.json';
    } else if (percentageCorrect >= 50) {
      return 'assets/lottie/confetti_great.json';
    } else {
      return 'assets/lottie/confetti_learning.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isLargeScreen = MediaQuery.of(context).size.width > 500;

    return Stack(
      children: [
        // Full-screen Lottie animation as background
        Positioned.fill(
          child: Lottie.asset(
            _getLottieAssetName(),
            fit: BoxFit.cover,
            repeat: true,
            animate: true,
          ),
        ),
        // Content Overlay
        Positioned.fill(
          child: Container(
            // Add a slight overlay to make text more readable
            color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Motivational Title
                    Text(
                      _getMotivationalTitle(context),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,

                        fontSize: isLargeScreen ? 60 : 40,
                      ),
                    ),
                    const SizedBox(height: 48),

                    // Results Summary
                    _buildResultCard(
                      context,
                      title: 'Correct:',
                      value: correctAnswers,
                      icon: Icons.check_circle,
                      color: Colors.greenAccent,
                      isLargeScreen: isLargeScreen,
                    ),
                    const SizedBox(height: 16),
                    _buildResultCard(
                      context,
                      title: 'Wrong:',
                      value: wrongAnswers,
                      icon: Icons.cancel,
                      color: Colors.redAccent,
                      isLargeScreen: isLargeScreen,
                    ),
                    const SizedBox(height: 16),
                    _buildResultCard(
                      context,
                      title: 'Skipped:',
                      value: skippedQuestions,
                      icon: Icons.skip_next,
                      color: Colors.blueAccent,
                      isLargeScreen: isLargeScreen,
                    ),
                    const SizedBox(height: 48),

                    // Back to Exercise Home Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Pop all routes until ExerciseHomeRoute
                        AutoRouter.of(
                          context,
                        ).popUntilRouteWithName(ExerciseHomeRoute.name);
                      },
                      icon: Icon(
                        Icons.home,
                        size: isLargeScreen ? 30 : 24,
                        color: colorScheme.onPrimary,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'More Exercises',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: isLargeScreen ? 22 : 18,
                                color: colorScheme.onPrimary,
                              ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 8,
                        padding: EdgeInsets.symmetric(
                          horizontal: isLargeScreen ? 40 : 20,
                          vertical: isLargeScreen ? 20 : 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultCard(
    BuildContext context, {
    required String title,
    required int value,
    required IconData icon,
    required Color color,
    required bool isLargeScreen,
  }) {
    return Card(
      color: color.withValues(alpha: 0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white, size: isLargeScreen ? 40 : 30),
                const SizedBox(width: 15),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isLargeScreen ? 28 : 20,
                  ),
                ),
              ],
            ),
            Text(
              value.toString(),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isLargeScreen ? 40 : 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
