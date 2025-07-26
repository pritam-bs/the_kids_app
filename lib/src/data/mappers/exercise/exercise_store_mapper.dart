import 'dart:convert';

import 'package:the_kids_app/src/data/dtos/exercise/exercise_dto.dart';
import 'package:the_kids_app/src/data/dtos/exercise/exercise_store_dto.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';

extension ExerciseStoreMapper on ExerciseStoreDto {
  ExerciseDto toExerciseDto() {
    final Map<String, dynamic> jsonMap = jsonDecode(jsonContent);
    jsonMap[ExerciseConstants.exerciseType] = exerciseType;

    return ExerciseDto.fromJson(jsonMap);
  }
}

extension ExerciseMapper on ExerciseDto {
  ExerciseStoreDto toExerciseStoreDto() {
    return ExerciseStoreDto(
      exerciseType: map(
        matchWord: (_) => ExerciseType.matchWord.key,
        listenChoose: (_) => ExerciseType.listenChoose.key,
        spellWord: (_) => ExerciseType.spellWord.key,
        sentenceScramble: (_) => ExerciseType.sentenceScramble.key,
        fillBlank: (_) => ExerciseType.fillBlank.key,
      ),
      jsonContent: jsonEncode(toJson()),
    );
  }
}
