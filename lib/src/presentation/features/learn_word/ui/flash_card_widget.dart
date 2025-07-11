import 'package:flutter/material.dart';
import 'package:the_kids_app/src/domain/entities/learning_word/word_entity.dart';
import 'dart:math';

import 'package:the_kids_app/src/presentation/features/learn_word/ui/flash_card_image_widget.dart';

class FlashCardWidget extends StatefulWidget {
  final WordEntity word;
  final String categoryId;
  final String? imageUrl;

  const FlashCardWidget({
    super.key,
    required this.word,
    required this.categoryId,
    this.imageUrl,
  });

  @override
  State<FlashCardWidget> createState() => _FlashCardWidgetState();
}

class _FlashCardWidgetState extends State<FlashCardWidget> {
  bool _isFlipped = false;
  late Color _cardColor;

  final List<Color> _kidFriendlyColors = [
    Colors.lightBlue.shade400,
    Colors.lightGreen.shade500,
    Colors.orange.shade300,
    Colors.purple.shade300,
    Colors.pink.shade300,
    Colors.teal.shade300,
    Colors.amber.shade300,
    Colors.cyan.shade300,
    Colors.red.shade300,
    Colors.indigo.shade300,
    Colors.lime.shade500,
    Colors.deepOrange.shade300,
    Colors.blueGrey.shade400,
  ];

  @override
  void initState() {
    super.initState();
    _cardColor =
        _kidFriendlyColors[Random().nextInt(_kidFriendlyColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;

    final double responsiveImageHeight = (screenSize.height * 0.25).clamp(
      150.0,
      280.0,
    );
    final double mainWordFontSize = (screenSize.width * 0.1).clamp(36.0, 60.0);
    final double exampleSentenceFontSize = (screenSize.width * 0.05).clamp(
      18.0,
      28.0,
    );
    final double ipaFontSize = (screenSize.width * 0.04).clamp(16.0, 24.0);
    final double articleFontSize = (screenSize.width * 0.045).clamp(18.0, 26.0);

    return GestureDetector(
      onTap: () {
        setState(() {
          _isFlipped = !_isFlipped;
        });
      },
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            color: _cardColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlashCardImage(
                imageUrl: widget.imageUrl,
                responsiveImageHeight: responsiveImageHeight,
              ),
              const SizedBox(height: 24),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!_isFlipped && widget.word.article != null)
                        Text(
                          widget.word.article!,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontSize: articleFontSize,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onPrimaryContainer,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      if (!_isFlipped && widget.word.article != null)
                        const SizedBox(height: 4),

                      // Word
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          _isFlipped ? widget.word.wordEn : widget.word.wordDe,
                          style: Theme.of(context).textTheme.displayMedium
                              ?.copyWith(
                                fontSize: mainWordFontSize,
                                fontWeight: FontWeight.w800,
                                color: colorScheme.onPrimaryContainer,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 3.0,
                                    color: Colors.black.withValues(alpha: 0.2),
                                  ),
                                ],
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (!_isFlipped) ...[
                        const SizedBox(height: 12),
                        Text(
                          '[${widget.word.ipa}]',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontSize: ipaFontSize,
                                fontStyle: FontStyle.italic,
                                color: colorScheme.onSecondaryContainer,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      const SizedBox(height: 24),

                      Text(
                        _isFlipped
                            ? widget.word.exampleSentenceEn
                            : widget.word.exampleSentenceDe,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: exampleSentenceFontSize,
                          color: colorScheme.onPrimaryContainer,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),

                      FloatingActionButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Playing pronunciation... (Not implemented yet)',
                              ),
                            ),
                          );
                        },
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                        elevation: 6,
                        child: const Icon(Icons.volume_up, size: 36),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
