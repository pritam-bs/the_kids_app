import 'dart:io';
import 'package:background_downloader/background_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/data/datasources/llm_model/mdel_data_source.dart';

class ModelDataSourceImpl implements ModelDataSource {
  final String _gcsBucketName;
  final String _gcsBaseUrl = 'https://storage.googleapis.com';

  ModelDataSourceImpl(@Named('model_gcs_bucket') this._gcsBucketName);
  final FileDownloader _downloader = FileDownloader();
  final Map<String, String> _runningTasks = {};

  @override
  Future<String?> downloadModel({
    required String modelFileName,
    Function(double)? onProgress,
  }) async {
    final task = DownloadTask(
      url: _getGcsUrl(modelFileName),
      filename: modelFileName,
      updates: Updates.statusAndProgress,
    );

    final result = await _downloader.download(
      task,
      onProgress: (progress) {
        if (onProgress != null) {
          onProgress(progress);
        }
      },
    );

    if (result.status == TaskStatus.complete) {
      _runningTasks[modelFileName] = task.taskId;
      return getLocalPath(modelFileName);
    } else {
      return null;
    }
  }

  @override
  void cancelDownload(String modelFileName) {
    final taskId = _runningTasks[modelFileName];
    if (taskId != null) {
      _downloader.cancelTaskWithId(taskId);
      _runningTasks.remove(modelFileName);
    }
  }

  @override
  Future<bool> isModelDownloaded(String modelFileName) async {
    final path = await getLocalPath(modelFileName);
    return await File(path).exists();
  }

  @override
  Future<void> deleteModel(String modelFileName) async {
    final path = await getLocalPath(modelFileName);
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
    final record = await _downloader.database.recordForId(
      _runningTasks[modelFileName]!,
    );
    if (record != null) {
      await _downloader.database.deleteRecordWithId(record.taskId);
    }
    _runningTasks.remove(modelFileName);
  }

  @override
  Future<String> getLocalPath(String modelFileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$modelFileName';
  }

  String _getGcsUrl(String modelFileName) {
    return '$_gcsBaseUrl/$_gcsBucketName/$modelFileName';
  }
}