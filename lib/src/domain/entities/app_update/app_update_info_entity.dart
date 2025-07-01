import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_update_info_entity.freezed.dart';

@freezed
abstract class AppUpdateInfoEntity with _$AppUpdateInfoEntity {
  const factory AppUpdateInfoEntity({
    required String currentVersion,
    required String minimumSupportedVersion,
    required String latestVersion,
    required bool shouldForceUpdate,
    required bool shouldRecommendUpdate,
    required String releaseNotes,
    required String? storeUrl,
  }) = _AppUpdateInfoEntity;
}
