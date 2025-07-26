enum ExerciseType {
  matchWord,
  listenChoose,
  spellWord,
  sentenceScramble,
  fillBlank,
}

abstract class ExerciseConstants {
  static const exerciseType = 'exerciseType';
  static const matchWord = 'matchWord';
  static const listenChoose = 'listenChoose';
  static const spellWord = 'spellWord';
  static const sentenceScramble = 'sentenceScramble';
  static const fillBlank = 'fillBlank';
}

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
      case ExerciseType.fillBlank:
        return ExerciseConstants.fillBlank;
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
      case ExerciseConstants.fillBlank:
        return ExerciseType.fillBlank;
      default:
        throw ArgumentError('Invalid exercise key: $key');
    }
  }
}
