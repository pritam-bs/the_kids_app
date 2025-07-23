import 'package:flutter/material.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'dart:math';
import 'package:the_kids_app/src/presentation/features/exercise/exercise_type.dart';

class SentenceScrambleExerciseCard extends StatefulWidget {
  final SentenceScrambleExerciseEntity data;
  final Function(bool isCorrect, ExerciseType type) onAnswerSubmitted;

  const SentenceScrambleExerciseCard({
    super.key,
    required this.data,
    required this.onAnswerSubmitted,
  });

  @override
  State<SentenceScrambleExerciseCard> createState() =>
      _SentenceScrambleExerciseCardState();
}

class _SentenceScrambleExerciseCardState
    extends State<SentenceScrambleExerciseCard>
    with SingleTickerProviderStateMixin {
  final List<String> _constructedWords = [];
  List<String> _scrambledWordsPool = [];
  final List<int> _originalScrambledIndicesUsed = [];

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
  void didUpdateWidget(covariant SentenceScrambleExerciseCard oldWidget) {
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
      _constructedWords.clear();
      _scrambledWordsPool = List.from(widget.data.scrambledWords)
        ..shuffle(Random());
      _originalScrambledIndicesUsed.clear();
      _isAnswered = false;
      _isCorrect = null;
      _showCorrectSentenceAnimation = false;
      _animationController.reset();
    });
  }

  void _addWord(String word, int originalIndexInPool) {
    if (_isAnswered) return;

    setState(() {
      _constructedWords.add(word);
      _scrambledWordsPool[originalIndexInPool] = '';
      _originalScrambledIndicesUsed.add(originalIndexInPool);
    });
  }

  void _removeLastWord() {
    if (_isAnswered || _constructedWords.isEmpty) return;

    setState(() {
      final removedWord = _constructedWords.removeLast();
      final originalIndex = _originalScrambledIndicesUsed.removeLast();
      _scrambledWordsPool[originalIndex] = removedWord;
    });
  }

  String _normalizeSentence(String sentence) {
    String normalized = sentence.toLowerCase().trim();
    normalized = normalized.replaceAll(RegExp(r'\s+'), ' ');
    normalized = normalized.replaceAllMapped(
      RegExp(r'\s([.,!?;:])'),
      (match) => match.group(1)!,
    );
    return normalized;
  }

  void _checkAnswer() async {
    if (_isAnswered) return;

    final String constructedSentenceRaw = _constructedWords.join(' ');
    final String normalizedConstructedSentence = _normalizeSentence(
      constructedSentenceRaw,
    );
    final String normalizedTargetSentence = _normalizeSentence(
      widget.data.targetGermanSentence,
    );

    setState(() {
      _isCorrect = (normalizedConstructedSentence == normalizedTargetSentence);
      _isAnswered = true;
    });

    widget.onAnswerSubmitted(_isCorrect!, ExerciseType.sentenceScramble);

    if (!_isCorrect!) {
      // Delay before showing correct answer
      await Future.delayed(const Duration(milliseconds: 1600));
      setState(() {
        _showCorrectSentenceAnimation = true;
      });
      _animationController.forward(from: 0.0);
    }
  }

  Color _getScrambledWordButtonColor(String word, ColorScheme colorScheme) {
    if (word.isEmpty) {
      return colorScheme.surfaceContainerHighest.withValues(alpha: 0.3);
    }
    if (_isAnswered) {
      return colorScheme.secondaryContainer.withValues(alpha: 0.5);
    }
    return colorScheme.secondaryContainer;
  }

  Color _getScrambledWordButtonTextColor(String word, ColorScheme colorScheme) {
    if (word.isEmpty) {
      return colorScheme.onSurfaceVariant.withValues(alpha: 0.3);
    }
    if (_isAnswered) {
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
    final double spacing = 0.0;

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
              'Make a sentence using the words below:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontSize: isLargeScreen ? 28 : 20,
              ),
              textAlign: TextAlign.center,
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
                    onTap: _removeLastWord,
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
                                    key: const ValueKey('constructedWords'),
                                    alignment: WrapAlignment.center,
                                    spacing: spacing,
                                    runSpacing: spacing,
                                    children: _constructedWords.map((word) {
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
                                        padding: const EdgeInsets.all(4),
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

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLargeScreen ? 4 : 2,
                childAspectRatio: isLargeScreen ? 2.5 : 2.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: _scrambledWordsPool.length,
              itemBuilder: (context, index) {
                final word = _scrambledWordsPool[index];
                final bool isUsed = word.isEmpty;

                return ElevatedButton(
                  onPressed: isUsed || _isAnswered
                      ? null
                      : () => _addWord(word, index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getScrambledWordButtonColor(
                      word,
                      colorScheme,
                    ),
                    foregroundColor: _getScrambledWordButtonTextColor(
                      word,
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
                    word,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: wordChipFontSize,
                      color: _getScrambledWordButtonTextColor(
                        word,
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
                      horizontal: 20,
                      vertical: 15,
                    ),
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _isAnswered ? null : _removeLastWord,
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
