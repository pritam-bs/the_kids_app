import 'package:flutter/material.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/core/tts/tts_service.dart';
import 'dart:math';
import 'package:the_kids_app/src/presentation/features/exercise/exercise_type.dart'; // For BoxConstraints

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

  bool _showCorrectWordAnimation = false;
  late AnimationController _animationController;

  final List<String> _correctWordLetters = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
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
      _scrambledLettersPool = List.from(widget.data.scrambledLetters)
        ..shuffle(Random());
      _originalScrambledIndicesUsed.clear();
      _isAnswered = false;
      _isCorrect = null;
      _showCorrectWordAnimation = false;
      _animationController.reset();
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

  void _checkAnswer() async {
    if (_isAnswered) return;

    final String constructedWord = _constructedLetters.join().toLowerCase();
    final String targetWord = widget.data.targetGermanWord.toLowerCase();

    setState(() {
      _isCorrect = (constructedWord == targetWord);
      _isAnswered = true;
    });

    widget.onAnswerSubmitted(_isCorrect!, ExerciseType.spellWord);

    if (!_isCorrect!) {
      // Delay before showing correct answer
      await Future.delayed(const Duration(milliseconds: 1600));
      setState(() {
        _showCorrectWordAnimation = true;
      });
      _animationController.forward(from: 0.0);
    }
  }

  Color _getScrambledLetterButtonColor(String letter, ColorScheme colorScheme) {
    if (letter.isEmpty) {
      return colorScheme.surfaceContainerHighest.withValues(alpha: 0.3);
    }
    if (_isAnswered) {
      return colorScheme.secondaryContainer.withValues(alpha: 0.5);
    }
    return colorScheme.secondaryContainer;
  }

  Color _getScrambledLetterButtonTextColor(
    String letter,
    ColorScheme colorScheme,
  ) {
    if (letter.isEmpty) {
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

    final double minConstructionBoxHeight = isLargeScreen ? 80 : 60;
    final double estimatedChipFontSize =
        Theme.of(context).textTheme.headlineSmall!.fontSize! *
        (isLargeScreen ? 1.0 : 0.8);
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
              'Listen to the word and spell it:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontSize: isLargeScreen ? 28 : 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

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

            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double containerWidth = isLargeScreen
                    ? 500
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
                    onTap: _removeLastLetter,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: minConstructionBoxHeight,
                      ),
                      child: Column(
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
                            child: _showCorrectWordAnimation
                                ? Text(
                                    widget.data.targetGermanWord,
                                    key: const ValueKey('correctWord'),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: _getConstructionBoxTextColor(
                                            colorScheme,
                                          ),
                                          fontSize: estimatedChipFontSize,
                                        ),
                                  )
                                : Wrap(
                                    key: const ValueKey('constructedLetters'),
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
            const SizedBox(height: 10),

            // English Translation Display
            // Only show if an answer has been submitted
            if (_isAnswered)
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

            // Check, Remove Last
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
                  onPressed: _isAnswered ? null : _removeLastLetter,
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
