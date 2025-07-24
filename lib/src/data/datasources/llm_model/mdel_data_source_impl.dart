import 'dart:async';
import 'dart:io';
import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_kids_app/src/data/datasources/llm_model/mdel_data_source.dart';

class ModelDataSourceImpl implements ModelDataSource {
  final FileDownloader _downloader;
  final String _gcsBucketName;
  final String _modelFileName;
  final SharedPreferences _prefs;
  final String _gcsBaseUrl = 'https://storage.googleapis.com';

  // A map to hold active reattach subscriptions to manage cleanup within a session.
  final Map<String, StreamSubscription> _reattachSubscriptions = {};

  ModelDataSourceImpl(
    @Named('model_downloader') this._downloader,
    @Named('model_gcs_bucket') this._gcsBucketName,
    @Named('gemma_model_file_name') this._modelFileName,
    this._prefs,
  );

  @override
  Future<String?> downloadModel({Function(double)? onProgress}) async {
    final task = DownloadTask(
      url: _getGcsUrl(_modelFileName),
      filename: _modelFileName,
      updates: Updates.statusAndProgress,
    );

    await _saveTaskId(_modelFileName, task.taskId);

    final result = await _downloader.download(task, onProgress: onProgress);

    if (result.status == TaskStatus.complete) {
      return getLocalPath();
    } else {
      await _removeTaskId(_modelFileName);
      return null;
    }
  }

  @override
  Future<bool> isModelDownloadedInProgress() async {
    debugPrint('${identityHashCode(_downloader)}');

    final taskId = await _getTaskId(_modelFileName);
    if (taskId == null) return false;

    final record = await _downloader.database.recordForId(taskId);
    if (record == null) return false;

    return !record.status.isFinalState;
  }

  @override
  Future<String?> reattachModelDownloading({
    Function(double)? onProgress,
  }) async {
    final completer = Completer<String?>();
    final taskId = await _getTaskId(_modelFileName);

    if (taskId == null) {
      completer.complete(null);
      return completer.future;
    }

    // Check the task's status before listening to avoid setting up a listener for a task that is already finished.
    final record = await _downloader.database.recordForId(taskId);
    if (record == null) {
      // Clean up stale ID
      await _removeTaskId(_modelFileName);
      completer.complete(null);
      return completer.future;
    }

    // Handle tasks that are ALREADY in a final state
    if (record.status.isFinalState) {
      if (record.status == TaskStatus.complete) {
        final path = await getLocalPath();
        completer.complete(path);
      } else {
        // Failed, Canceled, etc.
        // Clean up stale ID
        await _removeTaskId(_modelFileName);
        completer.complete(null);
      }
      return completer.future;
    }

    // Immediately provide the last known progress for instant UI feedback.
    onProgress?.call(record.progress);

    // Cancel any previous reattach subscription for this file.
    final previousSubscription = _reattachSubscriptions[_modelFileName];
    await previousSubscription?.cancel();
    _reattachSubscriptions.remove(_modelFileName);

    // Listen to the global stream for live updates.
    final subscription = _downloader.database.updates.listen((record) async {
      if (record.task.taskId == taskId) {
        onProgress?.call(record.progress);

        if (record.status.isFinalState) {
          // Guard against completing an already completed Future.
          if (!completer.isCompleted) {
            if (record.status == TaskStatus.complete) {
              // Success: complete with the file path.
              final path = await getLocalPath();
              completer.complete(path);
            } else {
              // Failed or Canceled: clean up the persisted ID and complete with null.
              await _removeTaskId(_modelFileName);
              completer.complete(null);
            }
          }
          // Clean up the listener to prevent memory leaks.
          await _reattachSubscriptions[_modelFileName]?.cancel();
          _reattachSubscriptions.remove(_modelFileName);
        }
      }
    });

    _reattachSubscriptions[_modelFileName] = subscription;
    return completer.future;
  }

  @override
  void cancelDownload() async {
    final taskId = await _getTaskId(_modelFileName);
    if (taskId != null) {
      await _downloader.cancelTaskWithId(taskId);
      await _removeTaskId(_modelFileName);
    }
  }

  @override
  Future<bool> isModelDownloaded() async {
    final path = await getLocalPath();
    return await File(path).exists();
  }

  @override
  Future<void> deleteModel() async {
    final path = await getLocalPath();
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }

    final taskId = await _getTaskId(_modelFileName);
    if (taskId != null) {
      // Clean up the downloader's database entry and our persisted ID.
      await _downloader.database.deleteRecordWithId(taskId);
      await _removeTaskId(_modelFileName);
    }
  }

  @override
  Future<String> getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$_modelFileName';
  }

  // --- Helper Methods ---

  String _prefsKey(String modelFileName) => 'task_id_for_$modelFileName';

  Future<void> _saveTaskId(String modelFileName, String taskId) async {
    await _prefs.setString(_prefsKey(modelFileName), taskId);
  }

  Future<String?> _getTaskId(String modelFileName) async {
    return _prefs.getString(_prefsKey(modelFileName));
  }

  Future<void> _removeTaskId(String modelFileName) async {
    await _prefs.remove(_prefsKey(modelFileName));
  }

  String _getGcsUrl(String modelFileName) {
    return '$_gcsBaseUrl/$_gcsBucketName/$modelFileName';
  }
}
