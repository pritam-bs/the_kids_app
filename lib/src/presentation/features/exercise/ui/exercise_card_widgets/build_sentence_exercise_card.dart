import 'package:flutter/material.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'dart:math';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';

class BuildSentenceExerciseCard extends StatefulWidget {
  final BuildSentenceExerciseEntity data;
  final Function(bool isCorrect, ExerciseType type) onAnswerSubmitted;

  const BuildSentenceExerciseCard({
    super.key,
    required this.data,
    required this.onAnswerSubmitted,
  });

  @override
  State<BuildSentenceExerciseCard> createState() =>
      _BuildSentenceExerciseCardState();
}

class _BuildSentenceExerciseCardState extends State<BuildSentenceExerciseCard>
    with SingleTickerProviderStateMixin {
  late List<String> _currentSentenceParts;
  late List<String> _optionsPool;
  int? _selectedOptionIndex;

  bool _isAnswered = false;
  bool? _isCorrect;

  bool _showCorrectSentenceAnimation = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
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
      });
    }
  }

  void _clearBlank() {
    if (_isAnswered || _selectedOptionIndex == null) return;

    // Find the word that was placed in the blank
    final int blankIndex = _currentSentenceParts.indexOf(
      _optionsPool[_selectedOptionIndex!],
    );
    if (blankIndex != -1) {
      setState(() {
        _currentSentenceParts[blankIndex] = ''; // Clear the blank
        _selectedOptionIndex = null;
      });
    }
  }

  void _checkAnswer() async {
    if (_isAnswered) return;

    String selectedWordInBlank = '';
    if (_selectedOptionIndex != null) {
      selectedWordInBlank = _optionsPool[_selectedOptionIndex!];
    }

    setState(() {
      _isCorrect =
          (selectedWordInBlank.toLowerCase() ==
          widget.data.correctAnswerWord.toLowerCase());
      _isAnswered = true;
    });

    widget.onAnswerSubmitted(_isCorrect!, ExerciseType.buildSentence);

    if (!_isCorrect!) {
      // Delay before showing correct answer
      await Future.delayed(const Duration(milliseconds: 1600));
      setState(() {
        _showCorrectSentenceAnimation = true;
      });
      _animationController.forward(from: 0.0);
    }
  }

  Color _getOptionButtonColor(
    String word,
    int optionIndex,
    ColorScheme colorScheme,
  ) {
    if (word.isEmpty) {
      return colorScheme.surfaceContainerHighest.withValues(alpha: 0.3);
    }
    if (_isAnswered) {
      if (optionIndex == _selectedOptionIndex) {
        return _isCorrect! ? colorScheme.primary : colorScheme.error;
      } else if (word.toLowerCase() ==
          widget.data.correctAnswerWord.toLowerCase()) {
        return colorScheme.primary.withValues(alpha: 0.5);
      }
      return colorScheme.secondaryContainer.withValues(alpha: 0.5);
    }
    return colorScheme.secondaryContainer;
  }

  Color _getOptionButtonTextColor(
    String word,
    int optionIndex,
    ColorScheme colorScheme,
  ) {
    if (word.isEmpty) {
      return colorScheme.onSurfaceVariant.withValues(alpha: 0.3);
    }
    if (_isAnswered) {
      if (optionIndex == _selectedOptionIndex) {
        return Colors.white;
      } else if (word.toLowerCase() ==
          widget.data.correctAnswerWord.toLowerCase()) {
        return Colors.white.withValues(alpha: 0.8);
      }
      return colorScheme.onSecondaryContainer.withValues(alpha: 0.5);
    }
    return colorScheme.onSecondaryContainer;
  }

  Color _getConstructionBoxColor(ColorScheme colorScheme) {
    if (!_isAnswered) {
      return colorScheme.outline;
    }
    return _isCorrect! ? colorScheme.primary : colorScheme.error;
  }

  Color _getConstructionBoxTextColor(ColorScheme colorScheme) {
    if (!_isAnswered) {
      return colorScheme.onSurfaceVariant;
    }
    return _isCorrect! ? colorScheme.primary : colorScheme.error;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLargeScreen = screenSize.width > 500;

    final double minConstructionBoxHeight = isLargeScreen ? 120 : 90;
    final double wordChipFontSize =
        Theme.of(context).textTheme.titleLarge!.fontSize! *
        (isLargeScreen ? 1.0 : 0.9);
    final double wordChipHeight = wordChipFontSize + 24;
    final double wordChipWidth = wordChipFontSize * 3 + 20;
    final double spacing = 2.0;

    return Card(
      color: colorScheme.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
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
                    : constraints.maxWidth;

                return Container(
                  width: containerWidth,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 4,
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
                    child: ConstrainedBox(
                      // Added ConstrainedBox
                      constraints: BoxConstraints(
                        minHeight: minConstructionBoxHeight,
                      ),
                      child: Column(
                        // Added Column with MainAxisSize.min
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedSwitcher(
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
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
                                                  .withValues(alpha: 0.5),
                                              style: BorderStyle.solid,
                                              width: 1.5,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
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
                                                      .withValues(alpha: 0.5),
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
                                                color: colorScheme
                                                    .onSurfaceVariant,
                                              ),
                                        ),
                                        backgroundColor: colorScheme.surface,
                                        padding: const EdgeInsets.all(2),
                                      );
                                    }).toList(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),

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

                return ElevatedButton(
                  onPressed: () => _fillBlank(optionWord, index),
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
                      horizontal: 20,
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
                      horizontal: 20,
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
