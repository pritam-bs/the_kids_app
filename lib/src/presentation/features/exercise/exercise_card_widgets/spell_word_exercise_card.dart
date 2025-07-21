import 'package:flutter/material.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/core/tts/tts_service.dart';
import 'package:the_kids_app/src/presentation/features/exercise/exercise_type.dart';

class SpellWordExerciseCard extends StatefulWidget {
  final SpellWordExerciseEntity data;
  final Function(bool isCorrect, ExerciseType type) onAnswerSubmitted;

  const SpellWordExerciseCard({
    super.key,
    required this.data,
    required this.onAnswerSubmitted,
  });

  @override
  State<SpellWordExerciseCard> createState() => _SpellWordExerciseCardState();
}

class _SpellWordExerciseCardState extends State<SpellWordExerciseCard> {
  final TtsService _ttsService = getIt<TtsService>();

  final List<String> _constructedLetters = [];
  List<String> _scrambledLettersPool = [];
  final List<int> _originalScrambledIndicesUsed = [];

  bool _isAnswered = false;
  bool? _isCorrect;

  @override
  void initState() {
    super.initState();
    _resetExercise();
  }

  void _resetExercise() {
    setState(() {
      _constructedLetters.clear();
      _scrambledLettersPool = List.from(widget.data.scrambledLetters);
      _originalScrambledIndicesUsed.clear();
      _isAnswered = false;
      _isCorrect = null;
    });
  }

  void _addLetter(String letter, int originalIndexInPool) {
    if (_isAnswered) return;

    setState(() {
      _constructedLetters.add(letter);
      _scrambledLettersPool[originalIndexInPool] = '';
      _originalScrambledIndicesUsed.add(originalIndexInPool);
    });
  }

  void _removeLastLetter() {
    if (_isAnswered || _constructedLetters.isEmpty) return;

    setState(() {
      final removedLetter = _constructedLetters.removeLast();
      final originalIndex = _originalScrambledIndicesUsed.removeLast();
      _scrambledLettersPool[originalIndex] = removedLetter;
    });
  }

  void _checkAnswer() {
    if (_isAnswered) return;

    final String constructedWord = _constructedLetters.join().toLowerCase();
    final String targetWord = widget.data.targetGermanWord.toLowerCase();

    setState(() {
      _isCorrect = (constructedWord == targetWord);
      _isAnswered = true;
    });

    widget.onAnswerSubmitted(_isCorrect!, ExerciseType.spellWord);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isCorrect! ? 'Correct!' : 'Try again!'),
        backgroundColor: _isCorrect! ? Colors.green : Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Color _getScrambledLetterButtonColor(String letter, ColorScheme colorScheme) {
    if (letter.isEmpty) {
      return colorScheme.surfaceContainerHighest.withOpacity(0.3);
    }
    if (_isAnswered) {
      return colorScheme.secondaryContainer.withOpacity(0.5);
    }
    return colorScheme.secondaryContainer;
  }

  Color _getScrambledLetterButtonTextColor(
    String letter,
    ColorScheme colorScheme,
  ) {
    if (letter.isEmpty) {
      return colorScheme.onSurfaceVariant.withOpacity(0.3);
    }
    if (_isAnswered) {
      return colorScheme.onSecondaryContainer.withOpacity(0.5);
    }
    return colorScheme.onSecondaryContainer;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLargeScreen = screenSize.width > 600;

    final double minConstructionBoxHeight = isLargeScreen ? 80 : 60;

    return Card(
      color: colorScheme.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(16),
      clipBehavior:
          Clip.antiAlias, // Ensures content respects card's rounded corners
      child: SingleChildScrollView(
        // Make the card's content scrollable
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Prompt Text
            Text(
              'Listen to the word and spell it:',
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

            // Word Construction Box
            Container(
              width: isLargeScreen ? 500 : double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.outline, width: 2),
              ),
              child: InkWell(
                onTap: _removeLastLetter,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: minConstructionBoxHeight,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: _constructedLetters.map((letter) {
                        return Chip(
                          label: Text(
                            letter,
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                          ),
                          backgroundColor: colorScheme.surface,
                          padding: const EdgeInsets.all(8),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Scrambled Letters List
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLargeScreen ? 7 : 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: _scrambledLettersPool.length,
              itemBuilder: (context, index) {
                final letter = _scrambledLettersPool[index];
                final bool isUsed = letter.isEmpty;

                return ElevatedButton(
                  onPressed: isUsed || _isAnswered
                      ? null
                      : () => _addLetter(letter, index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getScrambledLetterButtonColor(
                      letter,
                      colorScheme,
                    ),
                    foregroundColor: _getScrambledLetterButtonTextColor(
                      letter,
                      colorScheme,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                    padding: EdgeInsets.zero,
                    overlayColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                  ),
                  child: Text(
                    letter,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: isLargeScreen ? 28 : 22,
                      color: _getScrambledLetterButtonTextColor(
                        letter,
                        colorScheme,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),

            // Check, Remove Last, and Reset Buttons
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12.0,
              runSpacing: 12.0,
              children: [
                // Check Button
                ElevatedButton.icon(
                  onPressed: _isAnswered ? null : _checkAnswer,
                  icon: const Icon(Icons.check_circle),
                  label: const Text('Check'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: colorScheme.onPrimary,
                    backgroundColor: colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                // Remove Last Button
                ElevatedButton.icon(
                  onPressed: _isAnswered ? null : _removeLastLetter,
                  icon: const Icon(Icons.backspace),
                  label: const Text('Remove'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: colorScheme.onSurfaceVariant,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                // Reset Button - Now consistent in size and padding
                ElevatedButton.icon(
                  onPressed: _resetExercise,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: colorScheme.onSurfaceVariant,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
