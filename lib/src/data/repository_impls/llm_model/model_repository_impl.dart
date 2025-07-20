import 'dart:async';
import 'package:dio/dio.dart';
import 'package:the_kids_app/src/data/datasources/llm_model/mdel_data_source.dart';
import 'package:the_kids_app/src/domain/entities/llm_model/model_info_entity.dart';
import 'package:the_kids_app/src/domain/repositories/llm_model/model_repository.dart';

class ModelRepositoryImpl implements ModelRepository {
  final ModelDataSource _remoteDataSource;

  ModelRepositoryImpl(this._remoteDataSource);

  @override
  Future<Stream<double>> downloadModel({
    required String modelFileName,
    required CancelToken cancelToken,
  }) async {
    final controller = StreamController<double>();

    _remoteDataSource
        .downloadModel(
          modelFileName: modelFileName,
          onProgress: (progress) {
            if (!controller.isClosed) {
              controller.sink.add(progress);
            }
          },
          cancelToken: cancelToken,
        )
        .then((path) {
          if (!controller.isClosed) {
            if (path != null) {
              controller.sink.add(1.0);
            }
            controller.close();
          }
        })
        .catchError((error) {
          if (!controller.isClosed) {
            controller.sink.addError(error);
            controller.close();
          }
        });

    return controller.stream;
  }

  @override
  Future<ModelInfoEntity?> getModelInfo(String modelFileName) async {
    final exists = await _remoteDataSource.isModelDownloaded(modelFileName);
    final path = await _remoteDataSource.getLocalPath(modelFileName);
    if (exists) {
      return ModelInfoEntity(
        name: modelFileName,
        localPath: path,
        isDownloaded: true,
      );
    }
    return ModelInfoEntity(
      name: modelFileName,
      localPath: path,
      isDownloaded: false,
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
