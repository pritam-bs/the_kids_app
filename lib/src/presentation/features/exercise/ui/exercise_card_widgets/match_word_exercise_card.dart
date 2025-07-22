import 'package:flutter/material.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/core/tts/tts_service.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/presentation/features/exercise/exercise_type.dart';

class MatchWordExerciseCard extends StatefulWidget {
  final MatchWordExerciseEntity data;
  final Function(bool isCorrect, ExerciseType type) onAnswerSubmitted;

  const MatchWordExerciseCard({
    super.key,
    required this.data,
    required this.onAnswerSubmitted,
  });

  @override
  State<MatchWordExerciseCard> createState() => _MatchWordExerciseCardState();
}

class _MatchWordExerciseCardState extends State<MatchWordExerciseCard> {
  String? _selectedEnglishWord;
  bool? _isCorrect; // null: not answered, true: correct, false: incorrect
  bool _isAnswered = false;
  final TtsService _ttsService = getIt<TtsService>();

  // Helper to get button color based on state
  Color _getButtonColor(String option, ColorScheme colorScheme) {
    if (!_isAnswered) {
      return colorScheme.secondaryContainer; // Default color before answer
    }
    if (option == widget.data.correctEnglishWord) {
      return colorScheme.primary; // Correct answer color
    }
    if (option == _selectedEnglishWord && !_isCorrect!) {
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
    if (option == widget.data.correctEnglishWord) {
      return Colors.white;
    }
    if (option == _selectedEnglishWord && !_isCorrect!) {
      return Colors.white;
    }
    return colorScheme.onSecondaryContainer.withValues(alpha: 0.5);
  }

  void _onOptionSelected(String selectedWord) {
    if (_isAnswered) return; // Prevent multiple selections

    setState(() {
      _selectedEnglishWord = selectedWord;
      _isCorrect = (selectedWord == widget.data.correctEnglishWord);
      _isAnswered = true;
    });

    widget.onAnswerSubmitted(_isCorrect!, ExerciseType.matchWord);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLargeScreen = screenSize.width > 500;

    return Card(
      color:
          colorScheme.surface, // Use surface color for the main card background
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Target German Word
            Text(
              widget.data.targetGermanWord,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
                fontSize: isLargeScreen ? 72 : 48, // Responsive font size
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Speaker Button
            FloatingActionButton(
              heroTag:
                  null, // Set heroTag to null to avoid tag conflicts in PageView
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

            // List of English Words (Options)
            GridView.builder(
              shrinkWrap: true, // Important for GridView inside Column
              physics:
                  const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLargeScreen
                    ? 3
                    : 1, // 3 columns on large screens, 1 on small
                childAspectRatio: isLargeScreen ? 3 : 5, // Adjust aspect ratio
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: widget.data.englishOptions.length,
              itemBuilder: (context, index) {
                final option = widget.data.englishOptions[index];
                return ElevatedButton(
                  onPressed: () => _onOptionSelected(option),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getButtonColor(option, colorScheme),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                  child: Text(
                    option,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: _getButtonTextColor(option, colorScheme),
                      fontWeight: FontWeight.bold,
                      fontSize: isLargeScreen ? 24 : 20, // Responsive font size
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
