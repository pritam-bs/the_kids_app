import 'dart:ui';
import 'package:flutter/material.dart';

class AnswerFeedbackOverlay extends StatelessWidget {
  final bool isCorrect;
  final int animationTrigger;
  final VoidCallback? onAnimationComplete;

  const AnswerFeedbackOverlay({
    super.key,
    required this.isCorrect,
    required this.animationTrigger,
    this.onAnimationComplete,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final Key animationKey = ValueKey('feedback_animation_$animationTrigger');

    return Stack(
      // Use a Stack to layer the blur and the icon
      children: [
        Positioned.fill(
          // Makes the blur cover the entire screen
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
            child: Container(color: Colors.black.withValues(alpha: 0.5)),
          ),
        ),
        // The animated icon
        Center(
          child: TweenAnimationBuilder<double>(
            key: animationKey,
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1200),
            curve: Curves.elasticOut,
            builder: (context, scale, child) {
              return Opacity(
                opacity: scale.clamp(0.0, 1.0),
                child: Transform.scale(
                  scale: scale,
                  child: Icon(
                    isCorrect
                        ? Icons.check_circle_rounded
                        : Icons.cancel_rounded,
                    size: 150,
                    color: isCorrect ? colorScheme.primary : colorScheme.error,
                  ),
                ),
              );
            },
            onEnd: () {
              onAnimationComplete?.call();
            },
          ),
        ),
      ],
    );
  }
}
