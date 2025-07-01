import 'package:package_info_plus/package_info_plus.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/data/dtos/app_update/app_update_info_dto.dart';
import 'package:the_kids_app/src/data/mappers/app_update/app_update_info_mapper.dart';
import 'package:the_kids_app/src/domain/entities/app_update/app_update_info_entity.dart';
import 'package:the_kids_app/src/domain/repositories/app_update/app_update_check_repository.dart';

class AppUpdateCheckRepositoryImpl implements AppUpdateCheckRepository {
  @override
  Future<AppUpdateInfoEntity> getAppUpdateInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    final updateInfoDto = await _getRemoteUpdateInfo();

    return updateInfoDto.toEntity(currentVersion);
  }

  // Mock remote data - will be replaced with Firebase Remote Config
  Future<AppUpdateInfoDTO> _getRemoteUpdateInfo() async {
    // In real implementation, this would come from Firebase Remote Config
    await Future.delayed(const Duration(seconds: 1));
    try {
      return AppUpdateInfoDTO(
        minimumSupportedVersion: '1.0.0',
        latestVersion: '1.2.0',
        releaseNotes: 'Bug fixes and performance improvements',
        storeUrl:
            'https://play.google.com/store/apps/details?id=com.example.app',
      );
    } catch (e) {
      AppLogger.d(e);
      rethrow;
    }
  }
}
