abstract class ExerciseGenerator {
  Future<void> onModelDownloaded();
  Future<void> start();
  void pause();
  void resume();
}
