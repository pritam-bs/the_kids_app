import 'package:flutter/material.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/core/tts/tts_service.dart';
import 'package:the_kids_app/src/presentation/features/exercise/exercise_type.dart';

class ListenChooseExerciseCard extends StatefulWidget {
  final ListenChooseExerciseEntity data;
  final Function(bool isCorrect, ExerciseType type) onAnswerSubmitted;

  const ListenChooseExerciseCard({
    super.key,
    required this.data,
    required this.onAnswerSubmitted,
  });

  @override
  State<ListenChooseExerciseCard> createState() =>
      _ListenChooseExerciseCardState();
}

class _ListenChooseExerciseCardState extends State<ListenChooseExerciseCard> {
  String? _selectedGermanWord;
  bool? _isCorrect;
  bool _isAnswered = false;
  final TtsService _ttsService = getIt<TtsService>();

  // Helper to get button color based on state
  Color _getButtonColor(String option, ColorScheme colorScheme) {
    if (!_isAnswered) {
      return colorScheme.secondaryContainer; // Default color before answer
    }
    if (option == widget.data.targetGermanWord) {
      return colorScheme.primary; // Correct answer color
    }
    if (option == _selectedGermanWord && !_isCorrect!) {
      return colorScheme.error; // Incorrect selected answer color
    }
    return colorScheme.secondaryContainer.withValues(
      alpha: 0.5,
    ); // Other options after answer
  }

  // Helper to get text color based on state
  Color _getButtonTextColor(String option, ColorScheme colorScheme) {
    if (!_isAnswered) {
      return colorScheme.onSecondaryContainer;
    }
    if (option == widget.data.targetGermanWord) {
      return Colors.white;
    }
    if (option == _selectedGermanWord && !_isCorrect!) {
      return Colors.white;
    }
    return colorScheme.onSecondaryContainer.withValues(alpha: 0.5);
  }

  void _onOptionSelected(String selectedWord) {
    if (_isAnswered) return; // Prevent multiple selections

    setState(() {
      _selectedGermanWord = selectedWord;
      _isCorrect = (selectedWord == widget.data.targetGermanWord);
      _isAnswered = true;
    });

    // Trigger the callback
    widget.onAnswerSubmitted(_isCorrect!, ExerciseType.listenChoose);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLargeScreen = screenSize.width > 500;

    return Card(
      color: colorScheme.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Prompt Text
            Text(
              'Listen to the word and select the correct word from below:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontSize: isLargeScreen ? 28 : 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Speaker Button
            FloatingActionButton(
              heroTag: null,
              onPressed: () async {
                await _ttsService.speak(
                  widget.data.targetGermanWord,
                  languageCode: 'de-DE',
                );
              },
              backgroundColor: colorScheme.tertiary,
              foregroundColor: colorScheme.onTertiary,
              elevation: 6,
              child: const Icon(Icons.volume_up, size: 36),
            ),
            const SizedBox(height: 40),

            // List of German Words (Options)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLargeScreen ? 3 : 1,
                childAspectRatio: isLargeScreen ? 3 : 5,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: widget.data.germanOptions.length,
              itemBuilder: (context, index) {
                final option = widget.data.germanOptions[index];
                return ElevatedButton(
                  onPressed: () => _onOptionSelected(option),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getButtonColor(option, colorScheme),
                    foregroundColor: _getButtonTextColor(
                      option,
                      colorScheme,
                    ), // Explicitly set foreground
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    overlayColor: Colors.transparent, // Prevent default overlay
                    surfaceTintColor:
                        Colors.transparent, // Prevent default tint
                  ),
                  child: Text(
                    option,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: _getButtonTextColor(option, colorScheme),
                      fontWeight: FontWeight.bold,
                      fontSize: isLargeScreen ? 24 : 20,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
