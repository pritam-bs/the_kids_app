import 'package:the_kids_app/src/data/dtos/app_update/app_update_info_dto.dart';
import 'package:the_kids_app/src/domain/entities/app_update/app_update_info_entity.dart';

extension AppUpdateInfoMapper on AppUpdateInfoDTO {
  AppUpdateInfoEntity toEntity(String currentVersion) {
    final shouldForceUpdate = _isVersionLower(
      currentVersion,
      minimumSupportedVersion,
    );

    final shouldRecommendUpdate = _isVersionLower(
      currentVersion,
      latestVersion,
    );

    return AppUpdateInfoEntity(
      currentVersion: currentVersion,
      minimumSupportedVersion: minimumSupportedVersion,
      latestVersion: latestVersion,
      releaseNotes: releaseNotes,
      storeUrl: storeUrl,
      shouldForceUpdate: shouldForceUpdate,
      shouldRecommendUpdate: shouldRecommendUpdate,
    );
  }

  bool _isVersionLower(String current, String comparison) {
    // Version could be 1.0.0-dev
    final currentParts = current
        .split('-')[0]
        .split('.')
        .where((part) => int.tryParse(part) != null)
        .map(int.parse)
        .toList();
    final comparisonParts = comparison.split('.').map(int.parse).toList();

    for (var i = 0; i < comparisonParts.length; i++) {
      if (currentParts[i] < comparisonParts[i]) return true;
      if (currentParts[i] > comparisonParts[i]) return false;
    }
    return false;
  }
}
