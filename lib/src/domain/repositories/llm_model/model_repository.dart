import 'package:the_kids_app/src/domain/entities/llm_model/model_info_entity.dart';

abstract class ModelRepository {
  Future<Stream<double>> downloadModel({required String modelFileName});
  void cancelDownload(String modelFileName);
  Future<bool> isModelDownloadedInProgress(String modelFileName);
  Future<Stream<double>> reattachModelDownloading({
    required String modelFileName,
  });
  Future<ModelInfoEntity?> getModelInfo(String modelFileName);
  Future<void> deleteModel(String modelFileName);
  Future<String> getModelPath(String modelFileName);
}
