abstract class ExerciseGeneratorRepository {
  /// Notifies the repository that the underlying model for exercise generation has been downloaded.
  Future<void> notifyModelDownloaded();

  /// Starts the exercise generation process.
  Future<void> startExerciseGeneration();

  /// Pauses the exercise generation process.
  void pauseExerciseGeneration();

  /// Resumes the exercise generation process.
  void resumeExerciseGeneration();
}
