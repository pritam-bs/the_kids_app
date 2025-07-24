import 'package:the_kids_app/src/domain/entities/llm_model/model_info_entity.dart';

abstract class ModelRepository {
  Future<Stream<double>> downloadModel();
  void cancelDownload();
  Future<bool> isModelDownloadedInProgress();
  Future<Stream<double>> reattachModelDownloading();
  Future<ModelInfoEntity?> getModelInfo();
  Future<void> deleteModel();
  Future<String> getModelPath();
}
