import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';

abstract class ExerciseStoreRepository {
  Future<void> deleteExercise(int id);
  Future<List<ExerciseEntity>> getAllExercises();
  Future<List<ExerciseEntity>> getExercisesByType(ExerciseType type);
  Future<List<ExerciseEntity>> getNextExercises(int count, {int offset = 0});
  Future<List<ExerciseEntity>> getNextExercisesByType(
    ExerciseType type,
    int count, {
    int offset = 0,
  });
  Future<List<ExerciseEntity>> getRandomExercises(int count);
  Future<List<ExerciseEntity>> getRandomExercisesByType(
    ExerciseType type,
    int count,
  );
}
