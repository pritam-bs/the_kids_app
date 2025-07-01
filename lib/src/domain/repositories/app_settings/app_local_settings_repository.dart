
import 'package:the_kids_app/src/domain/entities/app_settings/app_settings_entity.dart';

abstract class AppLocalSettingsRepository {
  Future<AppSettingsEntity> getAppSettings();
  Future<void> saveAppSettings(AppSettingsEntity appSettings);

  // Convenience methods for lastSkippedVersion
  Future<String?> getLastSkippedVersion();
  Future<void> saveLastSkippedVersion(String? version);
}
