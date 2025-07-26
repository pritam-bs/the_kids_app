import 'package:the_kids_app/objectbox.g.dart';
import 'package:the_kids_app/src/data/datasources/exercise_store/exercise_store_datasource.dart';
import 'package:the_kids_app/src/data/dtos/exercise/exercise_store_dto.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';

class ExerciseStoreDatasourceImpl implements ExerciseStoreDatasource {
  final Box<ExerciseStoreDto> _exerciseBox;

  ExerciseStoreDatasourceImpl(this._exerciseBox);

  @override
  Future<void> addExercise(ExerciseStoreDto exercise) async {
    _exerciseBox.put(exercise);
  }

  @override
  Future<void> deleteExercise(int id) async {
    _exerciseBox.remove(id);
  }

  @override
  Future<List<ExerciseStoreDto>> getAllExercises() async {
    return _exerciseBox.getAll();
  }

  @override
  Future<List<ExerciseStoreDto>> getExercisesByType(ExerciseType type) async {
    return _exerciseBox
        .query(ExerciseStoreDto_.exerciseType.equals(type.key))
        .build()
        .find();
  }

  @override
  Future<List<ExerciseStoreDto>> getNextExercises(
    int count, {
    int offset = 0,
  }) async {
    final query = _exerciseBox.query().order(ExerciseStoreDto_.id).build();
    query
      ..offset = offset
      ..limit = count;
    return query.find();
  }


  @override
  Future<List<ExerciseStoreDto>> getNextExercisesByType(
    ExerciseType type,
    int count, {
    int offset = 0,
  }) async {
    final query = _exerciseBox
        .query(ExerciseStoreDto_.exerciseType.equals(type.key))
        .order(ExerciseStoreDto_.id)
        .build();
    query
      ..offset = offset
      ..limit = count;
    return query.find();
  }


  @override
  Future<List<ExerciseStoreDto>> getRandomExercises(int count) async {
    final allExercises = await getAllExercises();
    allExercises.shuffle();
    return allExercises.take(count).toList();
  }

  @override
  Future<List<ExerciseStoreDto>> getRandomExercisesByType(
    ExerciseType type,
    int count,
  ) async {
    final exercisesByType = await getExercisesByType(type);
    exercisesByType.shuffle();
    return exercisesByType.take(count).toList();
  }
}
