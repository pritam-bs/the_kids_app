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
  Future<Stream<double>> download() {
    AppLogger.d('UseCase: Initiating model download');
    return _modelRepository.downloadModel();
  }

  /// Checks if a download for the model is already in progress.
  /// This is useful for determining whether to start a new download or reattach.
  Future<bool> isModelDownloadedInProgress() {
    AppLogger.d(
      'UseCase: Checking if model download is in progress',
    );
    return _modelRepository.isModelDownloadedInProgress();
  }

  /// Reattaches to an existing download and returns a stream of its progress.
  Future<Stream<double>> reattachModelDownloading() {
    AppLogger.d(
      'UseCase: Reattaching to in-progress model download',
    );
    return _modelRepository.reattachModelDownloading(
    );
  }

  /// Cancels an ongoing download for the specified model.
  void cancelDownload() {
    AppLogger.d('UseCase: Cancelling model download');
    _modelRepository.cancelDownload();
  }

  /// Gets information about a model, including its download status and local path.
  Future<ModelInfoEntity?> getModelInfo() {
    AppLogger.d('UseCase: Getting model info');
    return _modelRepository.getModelInfo();
  }

  /// Deletes a downloaded model from local storage.
  Future<void> delete() {
    AppLogger.d('UseCase: Deleting model');
    return _modelRepository.deleteModel();
  }
}
