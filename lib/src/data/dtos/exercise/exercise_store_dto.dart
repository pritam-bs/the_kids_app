import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'exercise_store_dto.freezed.dart';

@Freezed(addImplicitFinal: false)
abstract class ExerciseStoreDto with _$ExerciseStoreDto {
  @Entity(realClass: ExerciseStoreDto)
  factory ExerciseStoreDto({
    @Default(0) @Id() int id,
    required String exerciseType,
    required String jsonContent,
  }) = _ExerciseStoreDto;
}
