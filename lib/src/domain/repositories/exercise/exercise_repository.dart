
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';

abstract class ExerciseRepository {
  Future<List<ExerciseEntity>> generateExercises({
    required ExerciseType type,
    required int numberOfExercises,
    List<String>? contextWords,
  });
}
