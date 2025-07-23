import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/domain/entities/llm_model/model_info_entity.dart';
import 'package:the_kids_app/src/domain/repositories/llm_model/model_repository.dart';

@injectable
class ModelUsecase {
  final ModelRepository _modelRepository;

  ModelUsecase(this._modelRepository);

  /// Initiates the model download and returns a stream of progress.
  /// The stream will emit values between 0.0 and 1.0.
  /// It completes with 1.0 on success or closes on failure/cancellation.
  Future<Stream<double>> download({required String modelFileName}) {
    AppLogger.d('UseCase: Initiating download for $modelFileName');
    return _modelRepository.downloadModel(modelFileName: modelFileName);
  }

  /// Cancels an ongoing download for the specified model.
  void cancelDownload(String modelFileName) {
    AppLogger.d('UseCase: Cancelling download for $modelFileName');
    _modelRepository.cancelDownload(modelFileName);
  }

  /// Gets information about a model, including its download status and local path.
  Future<ModelInfoEntity?> getModelInfo(String modelFileName) {
    AppLogger.d('UseCase: Getting info for $modelFileName');
    return _modelRepository.getModelInfo(modelFileName);
  }

  /// Deletes a downloaded model from local storage.
  Future<void> delete(String modelFileName) {
    AppLogger.d('UseCase: Deleting $modelFileName');
    return _modelRepository.deleteModel(modelFileName);
  }
}
