import 'package:flutter/material.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/core/tts/tts_service.dart';
import 'dart:math';
import 'package:the_kids_app/src/presentation/features/exercise/exercise_type.dart'; // For BoxConstraints

class BuildSentenceExerciseCard extends StatefulWidget {
  final BuildSentenceExerciseEntity data;
  final Function(bool isCorrect, ExerciseType type)? onAnswerSubmitted;

  const BuildSentenceExerciseCard({
    super.key,
    required this.data,
    this.onAnswerSubmitted,
  });

  @override
  State<BuildSentenceExerciseCard> createState() =>
      _BuildSentenceExerciseCardState();
}

class _BuildSentenceExerciseCardState extends State<BuildSentenceExerciseCard>
    with SingleTickerProviderStateMixin {
  final TtsService _ttsService = getIt<TtsService>();

  late List<String> _currentSentenceParts;
  late List<String> _optionsPool;
  int? _selectedOptionIndex; // Index of the selected option in the _optionsPool

  bool _isAnswered = false;
  bool? _isCorrect;

  bool _showCorrectSentenceAnimation = false;
  late AnimationController _animationController;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    );
    _resetExercise();
  }

  @override
  void didUpdateWidget(covariant BuildSentenceExerciseCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
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
      _currentSentenceParts = List.from(widget.data.sentenceWithMissingWord);
      _optionsPool = List.from(widget.data.optionsForMissingWord)
        ..shuffle(Random());
      _selectedOptionIndex = null;
      _isAnswered = false;
      _isCorrect = null;
      _showCorrectSentenceAnimation = false;
      _animationController.reset();
    });
  }

  void _fillBlank(String word, int optionIndex) {
    if (_isAnswered || _selectedOptionIndex != null) return;

    final int blankIndex = _currentSentenceParts.indexOf('');
    if (blankIndex != -1) {
      setState(() {
        _currentSentenceParts[blankIndex] = word;
        _selectedOptionIndex = optionIndex;
        // Do NOT mark option as used in _optionsPool by setting to '' here.
        // We need the original word for _clearBlank if the user decides to clear.
        // The button will be disabled by _selectedOptionIndex != null.
      });
    }
  }

  void _clearBlank() {
    if (_isAnswered || _selectedOptionIndex == null) return;

    final int blankIndex = _currentSentenceParts.indexOf(
      widget.data.optionsForMissingWord[_selectedOptionIndex!],
    );
    if (blankIndex != -1) {
      setState(() {
        // Restore the word to its original position in the options pool
        // This assumes _optionsPool is a shuffled copy of the original optionsForMissingWord
        // and we are restoring the specific word at the selected index.
        _optionsPool[_selectedOptionIndex!] = widget
            .data
            .optionsForMissingWord[_selectedOptionIndex!]; // Restore original word
        _currentSentenceParts[blankIndex] = ''; // Clear the blank
        _selectedOptionIndex = null;
      });
    }
  }

  void _checkAnswer() async {
    if (_isAnswered) return;

    // Find the word currently in the blank
    final int blankIndex = _currentSentenceParts.indexOf('');
    String selectedWordInBlank = '';
    if (blankIndex != -1) {
      // If blank is still empty, it means no word was selected. This case should be handled by disabling the check button.
      // If blank is filled, the word is at blankIndex.
      // However, it's safer to use the _selectedOptionIndex to get the actual word from optionsPool.
      if (_selectedOptionIndex != null) {
        selectedWordInBlank =
            widget.data.optionsForMissingWord[_selectedOptionIndex!];
      }
    } else {
      // Blank is filled, find the word that filled it.
      // This is a bit tricky if multiple words could be the same.
      // A more robust way is to track the actual word that went into the blank.
      // For now, let's assume _currentSentenceParts has the selected word.
      // Find the word that replaced the blank.
      final List<String> tempSentence = List.from(
        widget.data.sentenceWithMissingWord,
      );
      final int originalBlankIndex = tempSentence.indexOf('');
      if (originalBlankIndex != -1) {
        selectedWordInBlank = _currentSentenceParts[originalBlankIndex];
      }
    }

    // NEW: Compare the selected word directly with correctAnswerWord
    setState(() {
      _isCorrect =
          (selectedWordInBlank.toLowerCase() ==
          widget.data.correctAnswerWord.toLowerCase());
      _isAnswered = true;
    });

    if (widget.onAnswerSubmitted != null) {
      widget.onAnswerSubmitted!(_isCorrect!, ExerciseType.buildSentence);
    }

    if (!_isCorrect!) {
      setState(() {
        _showCorrectSentenceAnimation = true;
      });
      _animationController.forward(from: 0.0);
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

  Color _getOptionButtonColor(
    String word,
    int optionIndex,
    ColorScheme colorScheme,
  ) {
    if (word.isEmpty) {
      return colorScheme.surfaceContainerHighest.withOpacity(0.3);
    }
    if (_isAnswered) {
      // If this option was the one selected by the user
      if (optionIndex == _selectedOptionIndex) {
        return _isCorrect! ? Colors.green.shade400 : Colors.red.shade400;
      }
      // If this option is the correct answer word (but not necessarily selected by user)
      else if (word.toLowerCase() ==
          widget.data.correctAnswerWord.toLowerCase()) {
        return Colors.green.shade400.withOpacity(
          0.5,
        ); // Highlight correct answer
      }
      return colorScheme.secondaryContainer.withOpacity(0.5); // Other options
    }
    return colorScheme.secondaryContainer;
  }

  Color _getOptionButtonTextColor(
    String word,
    int optionIndex,
    ColorScheme colorScheme,
  ) {
    if (word.isEmpty) {
      return colorScheme.onSurfaceVariant.withOpacity(0.3);
    }
    if (_isAnswered) {
      if (optionIndex == _selectedOptionIndex) {
        return Colors.white;
      } else if (word.toLowerCase() ==
          widget.data.correctAnswerWord.toLowerCase()) {
        return Colors.white.withOpacity(0.8);
      }
      return colorScheme.onSecondaryContainer.withOpacity(0.5);
    }
    return colorScheme.onSecondaryContainer;
  }

  Color _getConstructionBoxColor(ColorScheme colorScheme) {
    if (!_isAnswered) {
      return colorScheme.outline;
    }
    return _isCorrect! ? Colors.green.shade400 : Colors.red.shade400;
  }

  Color _getConstructionBoxTextColor(ColorScheme colorScheme) {
    if (!_isAnswered) {
      return colorScheme.onSurfaceVariant;
    }
    return _isCorrect! ? Colors.green.shade800 : Colors.red.shade800;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLargeScreen = screenSize.width > 600;

    final double minConstructionBoxHeight = isLargeScreen ? 120 : 90;
    final double wordChipFontSize =
        Theme.of(context).textTheme.titleLarge!.fontSize! *
        (isLargeScreen ? 1.0 : 0.9);
    final double wordChipHeight = wordChipFontSize + 24;
    final double wordChipWidth = wordChipFontSize * 3 + 24;
    final double spacing = 10.0;

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
            Text(
              'Complete the sentence:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontSize: isLargeScreen ? 28 : 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

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
            const SizedBox(height: 30),

            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double containerWidth = isLargeScreen
                    ? 600
                    : constraints.maxWidth - (24.0 * 2);
                final double innerContentWidth = containerWidth - (10.0 * 2);

                final double effectiveWordChipWidthWithSpacing =
                    wordChipWidth + spacing;
                int wordsPerRow = 1;
                if (effectiveWordChipWidthWithSpacing > 0) {
                  wordsPerRow =
                      (innerContentWidth / effectiveWordChipWidthWithSpacing)
                          .floor();
                  if (wordsPerRow == 0) wordsPerRow = 1;
                }

                int numRows = 1;
                if (wordsPerRow > 0) {
                  numRows =
                      ((_showCorrectSentenceAnimation
                                  ? widget.data.targetGermanSentence
                                        .split(' ')
                                        .length
                                  : _currentSentenceParts.length) /
                              wordsPerRow)
                          .ceil();
                  if (numRows == 0) numRows = 1;
                }
                final double calculatedHeight =
                    (numRows * (wordChipHeight + spacing)) -
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
                    ),
                  ),
                  child: InkWell(
                    onTap: _clearBlank,
                    child: Align(
                      alignment: Alignment.center,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                        child: _showCorrectSentenceAnimation
                            ? Text(
                                widget.data.targetGermanSentence,
                                key: const ValueKey('correctSentence'),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: _getConstructionBoxTextColor(
                                        colorScheme,
                                      ),
                                      fontSize: wordChipFontSize,
                                    ),
                              )
                            : Wrap(
                                key: const ValueKey('currentSentence'),
                                alignment: WrapAlignment.center,
                                spacing: spacing,
                                runSpacing: spacing,
                                children: _currentSentenceParts.map((word) {
                                  if (word.isEmpty) {
                                    return Container(
                                      width: wordChipWidth,
                                      height: wordChipHeight,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: colorScheme.outline
                                              .withOpacity(0.5),
                                          style: BorderStyle.solid,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '____',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              color: colorScheme
                                                  .onSurfaceVariant
                                                  .withOpacity(0.5),
                                            ),
                                      ),
                                    );
                                  }
                                  return Chip(
                                    label: Text(
                                      word,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
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
            const SizedBox(height: 30),

            // Options for Missing Word
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLargeScreen ? 3 : 2,
                childAspectRatio: isLargeScreen ? 3.0 : 2.5,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: _optionsPool.length,
              itemBuilder: (context, index) {
                final optionWord = _optionsPool[index];
                final bool isUsedOrSelectedOrAnswered =
                    optionWord.isEmpty ||
                    _selectedOptionIndex != null ||
                    _isAnswered;

                return ElevatedButton(
                  onPressed: isUsedOrSelectedOrAnswered
                      ? null
                      : () => _fillBlank(optionWord, index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getOptionButtonColor(
                      optionWord,
                      index,
                      colorScheme,
                    ),
                    foregroundColor: _getOptionButtonTextColor(
                      optionWord,
                      index,
                      colorScheme,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    overlayColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                  ),
                  child: Text(
                    optionWord,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: wordChipFontSize,
                      color: _getOptionButtonTextColor(
                        optionWord,
                        index,
                        colorScheme,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),

            // Check and Reset Buttons
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12.0,
              runSpacing: 12.0,
              children: [
                ElevatedButton.icon(
                  onPressed: _isAnswered || _selectedOptionIndex == null
                      ? null
                      : _checkAnswer,
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
                ElevatedButton.icon(
                  onPressed: _isAnswered ? null : _clearBlank,
                  icon: const Icon(Icons.backspace),
                  label: const Text('Clear'),
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
