import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';

part 'exercise_dto.freezed.dart';
part 'exercise_dto.g.dart';

@Freezed(unionKey: ExerciseConstants.exerciseType)
abstract class ExerciseDto with _$ExerciseDto {
  const ExerciseDto._();

  @FreezedUnionValue(ExerciseConstants.matchWord)
  const factory ExerciseDto.matchWord({
    required String targetGermanWord,
    required List<String> englishOptions,
    required String correctEnglishWord,
  }) = MatchWordExerciseDto;

  @FreezedUnionValue(ExerciseConstants.listenChoose)
  const factory ExerciseDto.listenChoose({
    required String targetGermanWord,
    required List<String> germanOptions,
  }) = ListenChooseExerciseDto;

  @FreezedUnionValue(ExerciseConstants.spellWord)
  const factory ExerciseDto.spellWord({
    required String targetGermanWord,
    required List<String> scrambledLetters,
    required String englishTranslation,
  }) = SpellWordExerciseDto;

  @FreezedUnionValue(ExerciseConstants.sentenceScramble)
  const factory ExerciseDto.sentenceScramble({
    required String targetGermanSentence,
    required String englishTranslation,
    required List<String> scrambledWords,
  }) = SentenceScrambleExerciseDto;

  factory ExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDtoFromJson(json);
}

List<ExerciseDto> exerciseListDtoFromJson(List<dynamic> jsonList) =>
    List<ExerciseDto>.from(jsonList.map((x) => ExerciseDto.fromJson(x)));
