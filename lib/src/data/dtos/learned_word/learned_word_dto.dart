import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'learned_word_dto.freezed.dart';
part 'learned_word_dto.g.dart';

@Freezed(addImplicitFinal: false)
abstract class LearnedWordDto with _$LearnedWordDto {
  @Entity(realClass: LearnedWordDto)
  factory LearnedWordDto({
    @Default(0) @Id() int id,
    required String word,
    required String category,
    @Default(0) int seenCount,
    @Default(0) int exerciseCount,
  }) = _LearnedWordDto;

  factory LearnedWordDto.fromJson(Map<String, dynamic> json) =>
      _$LearnedWordDtoFromJson(json);
}
