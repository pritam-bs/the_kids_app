import 'package:flutter/material.dart';
import 'package:the_kids_app/src/presentation/widgets/tts/sentence_splitter.dart';
import 'package:the_kids_app/src/presentation/widgets/tts/tts_controller.dart'; // Ensure this path is correct

/// A widget that displays text and visually highlights sentences as they are spoken.
///
/// This widget listens to a [TtsController] to determine which part of the [text]
/// to highlight. It is designed to be efficient, only rebuilding the text layout
/// when the highlighted sentence changes.
class TtsWidget extends StatefulWidget {
  /// The full text content to be displayed and spoken.
  final String text;

  /// The controller that manages TTS state and drives the highlighting.
  final TtsController controller;

  /// The default text style for the entire content.
  final TextStyle? textStyle;

  /// The specific text style to apply to the highlighted sentence.
  /// If provided, this style takes precedence over [highlightColor].
  final TextStyle? highlightedTextStyle;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// The background color for the highlighted sentence.
  /// This is only used if [highlightedTextStyle] is `null`.
  /// Defaults to `Colors.yellow`.
  final Color highlightColor;

  const TtsWidget({
    super.key,
    required this.text,
    required this.controller,
    this.textStyle,
    this.highlightedTextStyle,
    this.textAlign = TextAlign.start,
    this.highlightColor = Colors.yellow,
  });

  @override
  State<TtsWidget> createState() => _TtsWidgetState();
}

class _TtsWidgetState extends State<TtsWidget> {
  @override
  void initState() {
    super.initState();
    // On initial build, ensure the controller has the correct text.
    // This synchronizes the widget's state with the controller's state.
    widget.controller.setTextToSpeak(widget.text);
  }

  @override
  void didUpdateWidget(covariant TtsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the parent widget rebuilds with new text, update the controller.
    // This is the key to keeping the controller's text in sync.
    if (widget.text != oldWidget.text) {
      widget.controller.setTextToSpeak(widget.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ListenableBuilder efficiently rebuilds only this RichText part when
    // the controller notifies of changes (e.g., new highlighting offsets).
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (BuildContext context, Widget? child) {
        final int start = widget.controller.highlightStartOffset;
        final int end = widget.controller.highlightEndOffset;
        final bool highlightEnabled = widget.controller.isHighlightingEnabled;

        final TextStyle defaultTextStyle =
            widget.textStyle ?? DefaultTextStyle.of(context).style;

        // --- Safety Check ---
        // If highlighting is disabled or the offsets are invalid, return a simple
        // Text widget for maximum efficiency and safety.
        if (!highlightEnabled ||
            start < 0 ||
            end <= start ||
            end > widget.text.length) {
          return RichText(
            textAlign: widget.textAlign,
            text: TextSpan(
              style: defaultTextStyle,
              children: <InlineSpan>[
                for (TextSegment sentence
                    in widget.controller.sentenceList) ...[
                  TextSpan(text: sentence.text, style: defaultTextStyle),
                  TextSpan(text: ' '),
                ],
              ],
            ),
          );
        }

        // --- Text Segmentation ---
        // Safely create the text segments for highlighting.
        final String before = widget.text.substring(0, start);
        final String marked = widget.text.substring(start, end);
        final String after = widget.text.substring(end);

        // --- Style Calculation ---
        // Determine the style for the highlighted portion. The custom
        // `highlightedTextStyle` takes precedence over the `highlightColor`.
        final TextStyle effectiveHighlightedStyle =
            widget.highlightedTextStyle ??
            defaultTextStyle.copyWith(backgroundColor: widget.highlightColor);

        // --- Build RichText ---
        // Use RichText to combine the styled and unstyled parts.
        return RichText(
          textAlign: widget.textAlign,
          text: TextSpan(
            style: defaultTextStyle,
            children: <InlineSpan>[
              TextSpan(text: before),
              TextSpan(text: marked, style: effectiveHighlightedStyle),
              TextSpan(text: after),
            ],
          ),
        );
      },
    );
  }
}
