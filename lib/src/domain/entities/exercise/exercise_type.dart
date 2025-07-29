abstract class ExerciseConstants {
  static const exerciseType = 'exerciseType';
  static const matchWord = 'matchWord';
  static const listenChoose = 'listenChoose';
  static const spellWord = 'spellWord';
  static const sentenceScramble = 'sentenceScramble';
  static const fillBlank = 'fillBlank';
}

enum ExerciseType { matchWord, listenChoose, spellWord, sentenceScramble }

// Extension on the enum to get its value as a string
extension ExerciseTypeExtension on ExerciseType {
  String get key {
    switch (this) {
      case ExerciseType.matchWord:
        return ExerciseConstants.matchWord;
      case ExerciseType.listenChoose:
        return ExerciseConstants.listenChoose;
      case ExerciseType.spellWord:
        return ExerciseConstants.spellWord;
      case ExerciseType.sentenceScramble:
        return ExerciseConstants.sentenceScramble;
    }
  }

  static ExerciseType fromKey(String key) {
    switch (key) {
      case ExerciseConstants.matchWord:
        return ExerciseType.matchWord;
      case ExerciseConstants.listenChoose:
        return ExerciseType.listenChoose;
      case ExerciseConstants.spellWord:
        return ExerciseType.spellWord;
      case ExerciseConstants.sentenceScramble:
        return ExerciseType.sentenceScramble;
      default:
        throw ArgumentError('Invalid exercise key: $key');
    }
  }
}
