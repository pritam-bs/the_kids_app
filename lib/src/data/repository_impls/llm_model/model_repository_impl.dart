import 'dart:async';
import 'package:the_kids_app/src/data/datasources/llm_model/mdel_data_source.dart'
    show ModelDataSource;
import 'package:the_kids_app/src/domain/entities/llm_model/model_info_entity.dart';
import 'package:the_kids_app/src/domain/repositories/llm_model/model_repository.dart';

class ModelRepositoryImpl implements ModelRepository {
  final ModelDataSource _remoteDataSource;

  ModelRepositoryImpl(this._remoteDataSource);

  @override
  Future<Stream<double>> downloadModel() async {
    final controller = StreamController<double>();

    _remoteDataSource
        .downloadModel(
          onProgress: (progress) {
            if (!controller.isClosed) {
              final clampedProgress = progress.clamp(0.0, 1.0);
              controller.sink.add(clampedProgress);
            }
          },
        )
        .then((path) {
          if (!controller.isClosed) {
            if (path != null) {
              // On successful completion, send 1.0 and close the stream
              controller.sink.add(1.0);
              controller.close();
            } else {
              // Handle download failure or cancellation
              controller.close();
            }
          }
        })
        .catchError((error) {
          if (!controller.isClosed) {
            controller.addError(error);
            controller.close();
          }
        });

    return controller.stream;
  }

  @override
  Future<bool> isModelDownloadedInProgress() {
    return _remoteDataSource.isModelDownloadedInProgress();
  }

  @override
  Future<Stream<double>> reattachModelDownloading() async {
    final controller = StreamController<double>();

    _remoteDataSource
        .reattachModelDownloading(
          onProgress: (progress) {
            // The data source's callback feeds our stream.
            if (!controller.isClosed) {
              final clampedProgress = progress.clamp(0.0, 1.0);
              controller.sink.add(clampedProgress);
            }
          },
        )
        .then((path) {
          if (!controller.isClosed) {
            if (path != null) {
              // Reattached download completed successfully.
              controller.sink.add(1.0);
              controller.close();
            } else {
              // Reattached download failed or was cancelled.
              controller.close();
            }
          }
        })
        .catchError((error) {
          if (!controller.isClosed) {
            controller.addError(error);
            controller.close();
          }
        });

    return controller.stream;
  }

  @override
  void cancelDownload() {
    _remoteDataSource.cancelDownload();
  }

  @override
  Future<ModelInfoEntity?> getModelInfo() async {
    final isDownloaded = await _remoteDataSource.isModelDownloaded(
    );
    final localPath = await _remoteDataSource.getLocalPath();

    return ModelInfoEntity(
      localPath: localPath,
      isDownloaded: isDownloaded,
    );
  }

  @override
  Future<void> deleteModel() {
    return _remoteDataSource.deleteModel();
  }

  @override
  Future<String> getModelPath() {
    return _remoteDataSource.getLocalPath();
  }
}
