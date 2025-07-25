import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_dto.freezed.dart';
part 'exercise_dto.g.dart';

@Freezed(unionKey: 'exerciseType')
abstract class ExerciseDto with _$ExerciseDto {
  const ExerciseDto._();

  @FreezedUnionValue('matchWord')
  const factory ExerciseDto.matchWord({
    required String targetGermanWord,
    required List<String> englishOptions,
    required String correctEnglishWord,
  }) = MatchWordExerciseDto;

  @FreezedUnionValue('listenChoose')
  const factory ExerciseDto.listenChoose({
    required String targetGermanWord,
    required List<String> germanOptions,
  }) = ListenChooseExerciseDto;

  @FreezedUnionValue('spellWord')
  const factory ExerciseDto.spellWord({
    required String targetGermanWord,
    required List<String> scrambledLetters,
    required String englishTranslation,
  }) = SpellWordExerciseDto;

  @FreezedUnionValue('sentenceScramble')
  const factory ExerciseDto.sentenceScramble({
    required String targetGermanSentence,
    required String englishTranslation,
    required List<String> scrambledWords,
  }) = SentenceScrambleExerciseDto;

  @FreezedUnionValue('fillBlank')
  const factory ExerciseDto.fillBlank({
    required String targetGermanSentence,
    required String englishTranslation,
    required List<String> sentenceWithMissingWord,
    required List<String> optionsForMissingWord,
    required String correctAnswerWord,
  }) = FillBlankExerciseDto;

  factory ExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDtoFromJson(json);
}

List<ExerciseDto> exerciseListDtoFromJson(List<dynamic> jsonList) =>
    List<ExerciseDto>.from(jsonList.map((x) => ExerciseDto.fromJson(x)));
