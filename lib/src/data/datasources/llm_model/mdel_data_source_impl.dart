import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/data/datasources/llm_model/mdel_data_source.dart';

class ModelDataSourceImpl implements ModelDataSource {
  final String _gcsBucketName;
  final String _gcsBaseUrl = 'https://storage.googleapis.com';
  final Dio _dio;

  ModelDataSourceImpl(
    @Named('model_gcs_bucket') this._gcsBucketName,
    @Named('model_download') this._dio,
  );

  @override
  Future<String> getLocalPath(String modelFileName) async {
    return _getLocalPath(modelFileName);
  }

  @override
  Future<bool> isModelDownloaded(String modelFileName) async {
    final localPath = await _getLocalPath(modelFileName);
    final file = File(localPath);
    return await file.exists();
  }

  @override
  Future<void> deleteModel(String modelFileName) async {
    final localPath = await _getLocalPath(modelFileName);
    final file = File(localPath);
    if (await file.exists()) {
      await file.delete();
      AppLogger.d('DataSource: Deleted "$modelFileName" from $localPath');
    } else {
      AppLogger.d('DataSource: Model "$modelFileName" not found at $localPath');
    }
  }

  @override
  Future<String?> downloadModel({
    required String modelFileName,
    Function(double)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final gcsUrl = _getGcsUrl(modelFileName);
    final localPath = await _getLocalPath(modelFileName);
    final file = File(localPath);

    if (await file.exists()) {
      AppLogger.d(
        'DataSource: Model "$modelFileName" already exists at $localPath.',
      );
      return localPath;
    }

    AppLogger.d(
      'DataSource: Downloading "$modelFileName" from $gcsUrl to $localPath...',
    );
    try {
      await _dio.download(
        gcsUrl,
        localPath,
        onReceiveProgress: (received, total) {
          if (total != -1 && onProgress != null) {
            onProgress(received / total);
          }
        },
        cancelToken: cancelToken,
      );
      AppLogger.d(
        'DataSource: Successfully downloaded "$modelFileName" to $localPath',
      );
      return localPath;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        AppLogger.e('DataSource: Download of "$modelFileName" cancelled.');
      } else {
        AppLogger.e(
          'DataSource: Error downloading "$modelFileName": ${e.message}',
        );
        if (e.response != null) {
          AppLogger.e('DataSource: Response data: ${e.response?.data}');
        }
      }
      return null;
    } catch (e) {
      AppLogger.e(
        'DataSource: Unexpected error downloading "$modelFileName": $e',
      );
      return null;
    }
  }

  String _getGcsUrl(String modelFileName) {
    return '$_gcsBaseUrl/$_gcsBucketName/$modelFileName';
  }

  Future<String> _getLocalPath(String modelFileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$modelFileName';
  }
}
