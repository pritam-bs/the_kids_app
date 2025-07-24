abstract class ModelDataSource {
  Future<String?> downloadModel({Function(double)? onProgress});
  void cancelDownload();

  Future<bool> isModelDownloadedInProgress();
  Future<String?> reattachModelDownloading({Function(double)? onProgress});

  Future<bool> isModelDownloaded();
  Future<void> deleteModel();
  Future<String> getLocalPath();
}
