import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_kids_app/src/domain/entities/learning_word/word_entity.dart';

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
  // Data for "Spell the Word" exercise - UPDATED
  const factory ExerciseEntity.spellWord({
    required String targetGermanWord, // The German word to be spelled
    required List<String>
    scrambledLetters, // Scrambled letters (includes extra)
  }) = SpellWordExerciseEntity;

  // Data for "Sentence Scramble" exercise
  const factory ExerciseEntity.sentenceScramble({
    required String scrambledSentenceDe,
    required String correctSentenceEn,
    // Add more properties like audio, image, etc.
  }) = SentenceScrambleExerciseEntity;

  // Data for "Build a Sentence" exercise
  const factory ExerciseEntity.buildSentence({
    required List<String> availableWords,
    required String targetSentenceEn,
    // Add more properties like target structure, audio, etc.
  }) = BuildSentenceExerciseEntity;

  // Add more exercise data types as needed
}
