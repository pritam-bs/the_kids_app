import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/domain/entities/llm_model/model_info_entity.dart';
import 'package:the_kids_app/src/domain/repositories/llm_model/model_repository.dart';

@injectable
class ModelUsecase {
  final ModelRepository _modelRepository;

  ModelUsecase(this._modelRepository);

  Future<Stream<double>> download({
    required String modelFileName,
    required CancelToken cancelToken,
  }) {
    AppLogger.d('UseCase: Initiating download for $modelFileName');
    return _modelRepository.downloadModel(
      modelFileName: modelFileName,
      cancelToken: cancelToken,
    );
  }

  Future<ModelInfoEntity?> getModelInfo(String modelFileName) {
    AppLogger.d('UseCase: Getting info for $modelFileName');
    return _modelRepository.getModelInfo(modelFileName);
  }

  Future<void> delete(String modelFileName) {
    AppLogger.d('UseCase: Deleting $modelFileName');
    return _modelRepository.deleteModel(modelFileName);
  }
}
