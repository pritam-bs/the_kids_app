import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// A list of common abbreviations that should not be treated as sentence terminators.
const _abbreviations = [
  'Mr.',
  'Mrs.',
  'Ms.',
  'Dr.',
  'Prof.',
  'Sr.',
  'Jr.',
  'e.g.',
  'i.e.',
  'vs',
  'etc.',
];

/// Pre-built regex for splitting sentences, constructed once for efficiency.
final RegExp _sentenceRegex = _buildSentenceRegex();

RegExp _buildSentenceRegex() {
  // Create a regex pattern from the abbreviations list.
  // This will look like: (Mr|Mrs|Ms|Dr...)
  // final abbreviationsPattern = _abbreviations.join('|');
  final String abbreviationsPattern = _abbreviations
      .map((abbr) => RegExp.escape(abbr))
      .join('|');

  // The regex finds punctuation (.?!) followed by whitespace and an uppercase letter.
  // It uses a negative lookbehind `(?<!...)` to ensure the character preceding
  // the punctuation is NOT one of the abbreviations in our list.
  final RegExp sentenceSplitterRegExp = RegExp(
    r'''(?<!\b(''' +
        abbreviationsPattern +
        r'''))(?<=[.?!]["']?)\s+(?=[A-Z"'])''',
    caseSensitive: true,
  );

  return sentenceSplitterRegExp;
}

/// Represents a segment of text, typically a sentence, with its content
/// and its start and end offsets in the original string.
class TextSegment extends Equatable {
  final String text;
  final int startOffset;
  final int endOffset;

  const TextSegment(this.text, this.startOffset, this.endOffset);

  @override
  String toString() =>
      'TextSegment(text: "$text", start: $startOffset, end: $endOffset)';

  @override
  List<Object> get props => [text, startOffset, endOffset];
}

/// Splits a given [text] into a list of [TextSegment] objects, each representing a sentence.
List<TextSegment> splitIntoSentences(String text) {
  final List<TextSegment> segments = [];
  if (text.trim().isEmpty) {
    return segments;
  }

  // Find the offset of the first non-whitespace character.
  // All sentence offsets will be relative to this.
  final int trimOffset = text.indexOf(text.trimLeft());

  // Trimmed text to handle leading/trailing spaces correctly.
  final String content = text.trim();

  int lastEnd = 0;
  for (final Match match in _sentenceRegex.allMatches(content)) {
    // The sentence content is from the end of the last match to the start of this one.
    // The +1 includes the ending punctuation mark.
    final sentenceText = content.substring(lastEnd, match.start);

    // Calculate the precise start and end offsets in the original, untrimmed string.
    final int start = trimOffset + lastEnd;
    final int end = start + sentenceText.length;

    segments.add(TextSegment(sentenceText, start, end));

    // The next sentence will start after the whitespace found by the match.
    lastEnd = match.end;
  }

  // Add the final remaining part of the text as the last sentence.
  if (lastEnd < content.length) {
    final sentenceText = content.substring(lastEnd);
    final int start = trimOffset + lastEnd;
    final int end = start + sentenceText.length;
    segments.add(TextSegment(sentenceText, start, end));
  }

  debugPrint("Split text into sentences: ");
  for (final segment in segments) {
    debugPrint("- $segment");
  }

  return segments;
}
