import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:the_kids_app/src/core/router/app_router.gr.dart';
import 'package:the_kids_app/src/presentation/colors/kids_colors.dart';

@RoutePage()
class ExerciseHomeScreen extends StatelessWidget {
  const ExerciseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLargeScreen =
        screenSize.width > 700; // Define a breakpoint for responsiveness

    // Determine padding and max width for content based on screen size
    final double horizontalPadding = isLargeScreen
        ? screenSize.width * 0.1
        : 16.0;
    final double buttonWidth = isLargeScreen
        ? 300
        : double.infinity; // Max width for buttons on large screens

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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 24.0,
        ),
        child: Center(
          child: SingleChildScrollView(
            // Allows content to scroll on smaller screens if it overflows
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
                  // Use Wrap for flexible button layout
                  spacing: 20.0, // Horizontal spacing between buttons
                  runSpacing: 20.0, // Vertical spacing between rows of buttons
                  alignment: WrapAlignment.center,
                  children: [
                    _buildExerciseButton(
                      context: context,
                      label: 'Match the Word',
                      icon: Icons
                          .link, // Puzzle piece alternative: Icons.extension
                      onPressed: () {
                        AutoRouter.of(context).push(ExerciseRoute());
                      },
                      buttonWidth: buttonWidth,
                      // Randomly assign a color
                      buttonColor: KidsColors.getRandomKidFriendlyColor(),
                    ),
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
                    // New: Sentence Scramble (Word Order)
                    _buildExerciseButton(
                      context: context,
                      label: 'Sentence Scramble',
                      icon:
                          Icons.sort_by_alpha, // Icon for reordering/scrambling
                      onPressed: () {
                        AutoRouter.of(context).push(ExerciseRoute());
                      },
                      buttonWidth: buttonWidth,
                      buttonColor: KidsColors.getRandomKidFriendlyColor(),
                    ),
                    // New: Build a Sentence (Guided)
                    _buildExerciseButton(
                      context: context,
                      label: 'Build a Sentence',
                      icon:
                          Icons.text_fields, // Icon for text/sentence building
                      onPressed: () {
                        AutoRouter.of(context).push(ExerciseRoute());
                      },
                      buttonWidth: buttonWidth,
                      buttonColor: KidsColors.getRandomKidFriendlyColor(),
                    ),
                  ],
                ),
                const SizedBox(height: 48),

                // Section for Story and All Exercises
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
                      onPressed: () {
                        context.router.pushNamed('StoryRoute');
                      },
                      buttonWidth: buttonWidth,
                      buttonColor: KidsColors.getRandomKidFriendlyColor(),
                      isPrimary: true, // Still highlight this one if desired
                    ),
                    // Removed "See All Exercises" button
                  ],
                ),
                const SizedBox(height: 24), // Spacing at the bottom
              ],
            ),
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
    bool isPrimary = false,
  }) {
    final Color onButtonColor = Colors.black;

    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 40, // Made icon significantly bigger for playfulness
          color: onButtonColor,
        ),
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
