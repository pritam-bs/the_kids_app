
import 'package:the_kids_app/src/data/dtos/exercise/exercise_dto.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';

extension ExerciseDtoMapper on ExerciseDto {
  /// Maps a single ExerciseDto to its corresponding ExerciseEntity.
  ExerciseEntity toEntity() {
    return when(
      matchWord: (targetGermanWord, englishOptions, correctEnglishWord) =>
          ExerciseEntity.matchWord(
            targetGermanWord: targetGermanWord,
            englishOptions: englishOptions,
            correctEnglishWord: correctEnglishWord,
          ),
      listenChoose: (targetGermanWord, germanOptions) =>
          ExerciseEntity.listenChoose(
            targetGermanWord: targetGermanWord,
            germanOptions: germanOptions,
          ),
      spellWord: (targetGermanWord, scrambledLetters, englishTranslation) =>
          ExerciseEntity.spellWord(
            targetGermanWord: targetGermanWord,
            scrambledLetters: scrambledLetters,
            englishTranslation: englishTranslation,
          ),
      sentenceScramble:
          (targetGermanSentence, englishTranslation, scrambledWords) =>
              ExerciseEntity.sentenceScramble(
                targetGermanSentence: targetGermanSentence,
                englishTranslation: englishTranslation,
                scrambledWords: scrambledWords,
              ),
      buildSentence:
          (
            targetGermanSentence,
            englishTranslation,
            sentenceWithMissingWord,
            optionsForMissingWord,
            correctAnswerWord,
          ) => ExerciseEntity.buildSentence(
            targetGermanSentence: targetGermanSentence,
            englishTranslation: englishTranslation,
            sentenceWithMissingWord: sentenceWithMissingWord,
            optionsForMissingWord: optionsForMissingWord,
            correctAnswerWord: correctAnswerWord,
          ),
    );
  }
}

extension ExerciseDtoListMapper on List<ExerciseDto> {
  /// Maps a list of ExerciseDto to a list of ExerciseEntity.
  List<ExerciseEntity> toEntityList() {
    return map((dto) => dto.toEntity()).toList();
  }
}
