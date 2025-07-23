abstract class ModelDataSource {
  Future<String?> downloadModel({
    required String modelFileName,
    Function(double)? onProgress,
  });
  void cancelDownload(String modelFileName);
  Future<bool> isModelDownloaded(String modelFileName);
  Future<void> deleteModel(String modelFileName);
  Future<String> getLocalPath(String modelFileName);
}
