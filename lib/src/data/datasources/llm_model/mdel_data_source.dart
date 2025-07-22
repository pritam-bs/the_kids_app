import 'package:dio/dio.dart';

abstract class ModelDataSource {
  Future<String?> downloadModel({
    required String modelFileName,
    Function(double)? onProgress,
    CancelToken? cancelToken,
  });
  Future<bool> isModelDownloaded(String modelFileName);
  Future<void> deleteModel(String modelFileName);
  Future<String> getLocalPath(String modelFileName);
}
