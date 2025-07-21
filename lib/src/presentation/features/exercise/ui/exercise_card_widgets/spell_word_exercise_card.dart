import 'package:flutter/material.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/core/tts/tts_service.dart';
import 'dart:math';
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

class _SpellWordExerciseCardState extends State<SpellWordExerciseCard>
    with SingleTickerProviderStateMixin {
  final TtsService _ttsService = getIt<TtsService>();

  final List<String> _constructedLetters = [];
  List<String> _scrambledLettersPool = [];
  final List<int> _originalScrambledIndicesUsed = [];

  bool _isAnswered = false;
  bool? _isCorrect;

  // Animation related for showing correct word
  bool _showCorrectWordAnimation = false;
  late AnimationController _animationController;
  late CurvedAnimation _curvedAnimation;

  // GlobalKeys for animating individual letter chips (though we're using AnimatedSwitcher now)
  // Keeping this for potential future granular letter animations if needed,
  // but AnimatedSwitcher handles the primary transition.
  // final Map<String, GlobalKey> _letterKeys = {}; // Not strictly needed for AnimatedSwitcher transition
  final List<String> _correctWordLetters =
      []; // Letters of the target German word

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Animation duration
    );
    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack, // A nice bouncy curve for rearrangement
    );

    _correctWordLetters.addAll(widget.data.targetGermanWord.split(''));
    _resetExercise();
  }

  @override
  void didUpdateWidget(covariant SpellWordExerciseCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      _correctWordLetters.clear();
      _correctWordLetters.addAll(widget.data.targetGermanWord.split(''));
      _resetExercise();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _resetExercise() {
    setState(() {
      _constructedLetters.clear();
      // Create a mutable copy and shuffle it for a fresh start
      _scrambledLettersPool = List.from(widget.data.scrambledLetters)
        ..shuffle(Random());
      _originalScrambledIndicesUsed.clear();
      _isAnswered = false;
      _isCorrect = null;
      _showCorrectWordAnimation = false; // Reset animation state
      _animationController.reset(); // Reset animation controller
      // _letterKeys.clear(); // No longer generating keys for AnimatedPositioned directly
    });
  }

  void _addLetter(String letter, int originalIndexInPool) {
    if (_isAnswered) return; // Prevent interaction after answer

    setState(() {
      _constructedLetters.add(letter);
      _scrambledLettersPool[originalIndexInPool] = ''; // Mark as used/empty
      _originalScrambledIndicesUsed.add(originalIndexInPool);
    });
  }

  void _removeLastLetter() {
    if (_isAnswered || _constructedLetters.isEmpty) return;

    setState(() {
      final removedLetter = _constructedLetters.removeLast();
      final originalIndex = _originalScrambledIndicesUsed.removeLast();
      _scrambledLettersPool[originalIndex] = removedLetter; // Return to pool
    });
  }

  void _checkAnswer() async {
    // Made async for animation delay
    if (_isAnswered) return; // Prevent re-checking

    final String constructedWord = _constructedLetters.join().toLowerCase();
    final String targetWord = widget.data.targetGermanWord.toLowerCase();

    setState(() {
      _isCorrect = (constructedWord == targetWord);
      _isAnswered =
          true; // Set to true here to show translation and color feedback
    });

    widget.onAnswerSubmitted(_isCorrect!, ExerciseType.spellWord);

    if (!_isCorrect!) {
      // If incorrect, trigger animation to show correct word
      setState(() {
        _showCorrectWordAnimation = true;
      });
      _animationController.forward(from: 0.0); // Start the animation
      // Optionally, wait for animation to complete before showing SnackBar
      await Future.delayed(
        _animationController.duration! + const Duration(milliseconds: 200),
      );
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isCorrect! ? 'Correct!' : 'Try again!'),
        backgroundColor: _isCorrect! ? Colors.green : Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Helper to get button color for scrambled letters
  Color _getScrambledLetterButtonColor(String letter, ColorScheme colorScheme) {
    if (letter.isEmpty) {
      // If the letter is marked as used
      return colorScheme.surfaceContainerHighest.withOpacity(
        0.3,
      ); // Faded/disabled
    }
    if (_isAnswered) {
      return colorScheme.secondaryContainer.withOpacity(0.5);
    }
    return colorScheme.secondaryContainer; // Default active color
  }

  // Helper to get text color for scrambled letters
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

  // Helper to get the construction box border/text color based on answer
  Color _getConstructionBoxColor(ColorScheme colorScheme) {
    if (!_isAnswered) {
      return colorScheme.outline; // Default border color
    }
    return _isCorrect! ? Colors.green.shade400 : Colors.red.shade400;
  }

  // Helper to get the construction box text color based on answer
  Color _getConstructionBoxTextColor(ColorScheme colorScheme) {
    if (!_isAnswered) {
      return colorScheme.onSurfaceVariant; // Default text color
    }
    return _isCorrect! ? Colors.green.shade800 : Colors.red.shade800;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLargeScreen = screenSize.width > 600;

    final double minConstructionBoxHeight = isLargeScreen ? 80 : 60;
    // Estimated chip dimensions for position calculation (used for calculated height)
    final double estimatedChipFontSize =
        Theme.of(context).textTheme.headlineSmall!.fontSize! *
        (isLargeScreen ? 1.0 : 0.8);
    final double estimatedChipHeight = estimatedChipFontSize + 16;
    final double estimatedChipWidth = estimatedChipFontSize * 1.5 + 16;
    final double spacing = 8.0;

    return Card(
      color: colorScheme.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
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
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double containerWidth = isLargeScreen
                    ? 500
                    : constraints.maxWidth - (24.0 * 2); // Card padding
                final double innerContentWidth =
                    containerWidth - (10.0 * 2); // Container's own padding

                // Calculate required height based on content
                final double effectiveChipWidthWithSpacing =
                    estimatedChipWidth + spacing;
                int lettersPerRow = 1;
                if (effectiveChipWidthWithSpacing > 0) {
                  lettersPerRow =
                      (innerContentWidth / effectiveChipWidthWithSpacing)
                          .floor();
                  if (lettersPerRow == 0) lettersPerRow = 1;
                }

                int numRows = 1;
                if (lettersPerRow > 0) {
                  numRows =
                      ((_showCorrectWordAnimation
                                  ? _correctWordLetters.length
                                  : _constructedLetters.length) /
                              lettersPerRow)
                          .ceil();
                  if (numRows == 0) numRows = 1;
                }
                final double calculatedHeight =
                    (numRows * (estimatedChipHeight + spacing)) -
                    spacing +
                    (5.0 * 2);

                return Container(
                  width: containerWidth,
                  height: max(minConstructionBoxHeight, calculatedHeight),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _getConstructionBoxColor(colorScheme),
                      width: 2,
                    ), // Dynamic border color
                  ),
                  child: InkWell(
                    onTap: _removeLastLetter,
                    child: Align(
                      alignment: Alignment.center,
                      child: AnimatedSwitcher(
                        // Use AnimatedSwitcher for smooth transition
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                        child: _showCorrectWordAnimation
                            ? Text(
                                widget.data.targetGermanWord,
                                key: const ValueKey(
                                  'correctWord',
                                ), // Unique key for AnimatedSwitcher
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: _getConstructionBoxTextColor(
                                        colorScheme,
                                      ), // Dynamic text color
                                      fontSize: estimatedChipFontSize,
                                    ),
                              )
                            : Wrap(
                                key: const ValueKey(
                                  'constructedLetters',
                                ), // Unique key for AnimatedSwitcher
                                alignment: WrapAlignment.center,
                                spacing: spacing,
                                runSpacing: spacing,
                                children: _constructedLetters.map((letter) {
                                  return Chip(
                                    label: Text(
                                      letter,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
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
                );
              },
            ),
            const SizedBox(height: 10), // Reduced spacing to fit translation
            // NEW: English Translation Display
            if (_isAnswered) // Only show if an answer has been submitted
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.data.englishTranslation,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                    fontSize: isLargeScreen ? 20 : 16,
                  ),
                ),
              ),
            const SizedBox(height: 30), // Increased spacing after translation
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
                      horizontal: 25, // Consistent padding
                      vertical: 15, // Consistent padding
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
                      horizontal: 25, // Consistent padding
                      vertical: 15, // Consistent padding
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
                      horizontal: 25, // Consistent padding
                      vertical: 15, // Consistent padding
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
