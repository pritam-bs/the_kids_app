import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';
import 'package:the_kids_app/src/domain/repositories/exercise/exercise_repository.dart';

@injectable
class ExerciseUseCase {
  final ExerciseRepository _exerciseRepository;

  ExerciseUseCase(this._exerciseRepository);

  Future<List<ExerciseEntity>> call({
    required ExerciseType type,
    required int numberOfExercises,
    List<String>? contextWords,
  }) async {
    try {
      return await _exerciseRepository.generateExercises(
        type: type,
        numberOfExercises: numberOfExercises,
        contextWords: contextWords,
      );
    } catch (e) {
      throw Exception('Failed to get exercises through use case: $e');
    }
  }
}
