import 'package:the_kids_app/src/data/datasources/exercise_store/exercise_store_datasource.dart';
import 'package:the_kids_app/src/data/mappers/exercise/exercise_mapper.dart';
import 'package:the_kids_app/src/data/mappers/exercise/exercise_store_mapper.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';
import 'package:the_kids_app/src/domain/repositories/exercise_store/exercise_store_repository.dart';

class ExerciseStoreRepositoryImpl implements ExerciseStoreRepository {
  final ExerciseStoreDatasource _datasource;

  ExerciseStoreRepositoryImpl(this._datasource);


  @override
  Future<void> deleteExercise(int id) async {
    await _datasource.deleteExercise(id);
  }

  @override
  Future<List<ExerciseEntity>> getAllExercises() async {
    final dtos = await _datasource.getAllExercises();
    return dtos.map((dto) => dto.toExerciseDto().toEntity()).toList();
  }

  @override
  Future<List<ExerciseEntity>> getExercisesByType(ExerciseType type) async {
    final dtos = await _datasource.getExercisesByType(type);
    return dtos.map((dto) => dto.toExerciseDto().toEntity()).toList();
  }

  @override
  Future<List<ExerciseEntity>> getNextExercises(
    int count, {
    int offset = 0,
  }) async {
    final dtos = await _datasource.getNextExercises(count, offset: offset);
    return dtos.map((dto) => dto.toExerciseDto().toEntity()).toList();
  }

  @override
  Future<List<ExerciseEntity>> getNextExercisesByType(
    ExerciseType type,
    int count, {
    int offset = 0,
  }) async {
    final dtos = await _datasource.getNextExercisesByType(
      type,
      count,
      offset: offset,
    );
    return dtos.map((dto) => dto.toExerciseDto().toEntity()).toList();
  }

  @override
  Future<List<ExerciseEntity>> getRandomExercises(int count) async {
    final dtos = await _datasource.getRandomExercises(count);
    return dtos.map((dto) => dto.toExerciseDto().toEntity()).toList();
  }

  @override
  Future<List<ExerciseEntity>> getRandomExercisesByType(
    ExerciseType type,
    int count,
  ) async {
    final dtos = await _datasource.getRandomExercisesByType(type, count);
    return dtos.map((dto) => dto.toExerciseDto().toEntity()).toList();
  }
}
