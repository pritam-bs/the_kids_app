import 'dart:async';
import 'package:the_kids_app/src/data/datasources/llm_model/mdel_data_source.dart'
    show ModelDataSource;
import 'package:the_kids_app/src/domain/entities/llm_model/model_info_entity.dart';
import 'package:the_kids_app/src/domain/repositories/llm_model/model_repository.dart';

class ModelRepositoryImpl implements ModelRepository {
  final ModelDataSource _remoteDataSource;

  ModelRepositoryImpl(this._remoteDataSource);

  @override
  Future<Stream<double>> downloadModel({required String modelFileName}) async {
    final controller = StreamController<double>();

    _remoteDataSource
        .downloadModel(
          modelFileName: modelFileName,
          onProgress: (progress) {
            if (!controller.isClosed) {
              controller.sink.add(progress);
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
  Future<bool> isModelDownloadedInProgress(String modelFileName) {
    return _remoteDataSource.isModelDownloadedInProgress(modelFileName);
  }

  @override
  Future<Stream<double>> reattachModelDownloading({
    required String modelFileName,
  }) async {
    final controller = StreamController<double>();

    _remoteDataSource
        .reattachModelDownloading(
          modelFileName: modelFileName,
          onProgress: (progress) {
            // The data source's callback feeds our stream.
            if (!controller.isClosed) {
              controller.sink.add(progress);
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
  void cancelDownload(String modelFileName) {
    _remoteDataSource.cancelDownload(modelFileName);
  }

  @override
  Future<ModelInfoEntity?> getModelInfo(String modelFileName) async {
    final isDownloaded = await _remoteDataSource.isModelDownloaded(
      modelFileName,
    );
    final localPath = await _remoteDataSource.getLocalPath(modelFileName);

    return ModelInfoEntity(
      name: modelFileName,
      localPath: localPath,
      isDownloaded: isDownloaded,
    );
  }

  @override
  Future<void> deleteModel(String modelFileName) {
    return _remoteDataSource.deleteModel(modelFileName);
  }

  @override
  Future<String> getModelPath(String modelFileName) {
    return _remoteDataSource.getLocalPath(modelFileName);
  }
}
