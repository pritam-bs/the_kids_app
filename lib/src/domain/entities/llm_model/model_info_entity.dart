import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_info_entity.freezed.dart';

@freezed
abstract class ModelInfoEntity with _$ModelInfoEntity {
  const factory ModelInfoEntity({
    required String name,
    required String localPath,
    required bool isDownloaded,
  }) = _ModelInfoEntity;
}
