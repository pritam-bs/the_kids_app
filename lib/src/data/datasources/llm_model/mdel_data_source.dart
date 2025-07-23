abstract class ModelDataSource {
  Future<String?> downloadModel({
    required String modelFileName,
    Function(double)? onProgress,
  });
  void cancelDownload(String modelFileName);

  Future<bool> isModelDownloadedInProgress(String modelFileName);
  Future<String?> reattachModelDownloading({
    required String modelFileName,
    Function(double)? onProgress,
  });

  Future<bool> isModelDownloaded(String modelFileName);
  Future<void> deleteModel(String modelFileName);
  Future<String> getLocalPath(String modelFileName);
}
