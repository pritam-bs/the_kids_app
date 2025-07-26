import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';
import 'package:the_kids_app/src/domain/repositories/exercise_store/exercise_store_repository.dart';

@injectable
class ExerciseStoreUseCase {
  final ExerciseStoreRepository _exerciseStoreRepository;

  ExerciseStoreUseCase(this._exerciseStoreRepository);
  Future<List<ExerciseEntity>> call({required ExerciseType type}) async {
    try {
      return await _exerciseStoreRepository.getExercisesByType(type);
    } catch (e) {
      throw Exception('Failed to get exercises through use case: $e');
    }
  }
}
