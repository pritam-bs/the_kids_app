import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_entity.freezed.dart';

@freezed
sealed class ExerciseEntity with _$ExerciseEntity {
  // Data for "Match the Word" exercise
  const factory ExerciseEntity.matchWord({
    required String targetGermanWord, // The German word to be shown
    required List<String> englishOptions, // List of 3 English words (options)
    required String correctEnglishWord, // The correct English translation
  }) = MatchWordExerciseEntity;

  // Data for "Listen and Choose" exercise
  const factory ExerciseEntity.listenChoose({
    required String targetGermanWord, // The German word to be spoken
    required List<String> germanOptions, // List of 3 German words (options)
  }) = ListenChooseExerciseEntity;

  // Data for "Spell the Word" exercise
  const factory ExerciseEntity.spellWord({
    required String targetGermanWord,
    required String englishTranslation, // The German word to be spelled
    required List<String>
    scrambledLetters, // Scrambled letters (includes extra)
  }) = SpellWordExerciseEntity;

  // Data for "Sentence Scramble" exercise
  const factory ExerciseEntity.sentenceScramble({
    required String targetGermanSentence, // The correct German sentence
    required String englishTranslation, // English translation of the sentence
    required List<String>
    scrambledWords, // Scrambled words to construct the sentence
  }) = SentenceScrambleExerciseEntity;

  // Data for "Build a Sentence" exercise
  const factory ExerciseEntity.fillBlank({
    required String
    targetGermanSentence, // The complete correct German sentence
    required String englishTranslation, // English translation
    required List<String>
    sentenceWithMissingWord, // German sentence with one '' for the blank
    required List<String> optionsForMissingWord,
    required String correctAnswerWord, // Options to fill the blank
  }) = FillBlankExerciseEntity;
}
