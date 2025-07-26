import 'package:the_kids_app/src/data/dtos/exercise/exercise_store_dto.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';

abstract class ExerciseStoreDatasource {
  Future<void> addExercise(ExerciseStoreDto exercise);
  Future<void> deleteExercise(int id);
  Future<List<ExerciseStoreDto>> getAllExercises();
  Future<List<ExerciseStoreDto>> getExercisesByType(ExerciseType type);
  Future<List<ExerciseStoreDto>> getNextExercises(int count, {int offset = 0});
  Future<List<ExerciseStoreDto>> getNextExercisesByType(
    ExerciseType type,
    int count, {
    int offset = 0,
  });
  Future<List<ExerciseStoreDto>> getRandomExercises(int count);
  Future<List<ExerciseStoreDto>> getRandomExercisesByType(
    ExerciseType type,
    int count,
  );
}
