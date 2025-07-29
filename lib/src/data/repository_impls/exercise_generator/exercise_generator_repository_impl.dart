import 'package:the_kids_app/src/data/exercise_generator/exercise_generator.dart';
import 'package:the_kids_app/src/domain/repositories/exercise_generator/exercise_generator_repository.dart';

class ExerciseGeneratorRepositoryImpl implements ExerciseGeneratorRepository {
  final ExerciseGenerator _exerciseGenerator;

  ExerciseGeneratorRepositoryImpl(this._exerciseGenerator);

  @override
  Future<void> notifyModelDownloaded() {
    return _exerciseGenerator.onModelDownloaded();
  }

  @override
  Future<void> startExerciseGeneration() {
    return _exerciseGenerator.start();
  }

  @override
  void pauseExerciseGeneration() {
    _exerciseGenerator.pause();
  }

  @override
  void resumeExerciseGeneration() {
    _exerciseGenerator.resume();
  }
}
