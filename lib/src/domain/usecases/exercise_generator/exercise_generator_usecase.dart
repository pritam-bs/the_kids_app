import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/repositories/exercise_generator/exercise_generator_repository.dart';

@injectable
class ExerciseGeneratorUsecase {
  final ExerciseGeneratorRepository _repository;

  ExerciseGeneratorUsecase(this._repository);

  /// Executes the logic to handle model download completion.
  Future<void> handleModelDownloadCompletion() async {
    await _repository.notifyModelDownloaded();
  }

  /// Initiates the exercise generation flow.
  Future<void> initiateExerciseGeneration() async {
    await _repository.startExerciseGeneration();
  }

  /// Pauses the current exercise generation.
  void pauseExerciseGeneration() {
    _repository.pauseExerciseGeneration();
  }

  /// Resumes a paused exercise generation.
  void resumeExerciseGeneration() {
    _repository.resumeExerciseGeneration();
  }
}
