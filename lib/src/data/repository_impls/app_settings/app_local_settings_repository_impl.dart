import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_kids_app/src/data/dtos/app_settings/app_settings_dto.dart';
import 'package:the_kids_app/src/data/mappers/app_settings/app_settings_mapper.dart';
import 'package:the_kids_app/src/domain/entities/app_settings/app_settings_entity.dart';
import 'package:the_kids_app/src/domain/repositories/app_settings/app_local_settings_repository.dart';

class AppLocalSettingsRepositoryImpl implements AppLocalSettingsRepository {
  final SharedPreferences _prefs;
  static const _appSettingsKey = 'app_settings';

  AppLocalSettingsRepositoryImpl(this._prefs);

  @override
  Future<AppSettingsEntity> getAppSettings() async {
    final settingsString = _prefs.getString(_appSettingsKey);
    if (settingsString == null) {
      return AppSettingsEntity(); // Return default, empty object
    }
    final settingsDto = AppSettingsDto.fromJson(json.decode(settingsString));
    return settingsDto.toDomain();
  }

  @override
  Future<void> saveAppSettings(AppSettingsEntity appSettings) async {
    final settingsDto = appSettings.toDto();
    await _prefs.setString(_appSettingsKey, json.encode(settingsDto.toJson()));
  }

  @override
  Future<String?> getLastSkippedVersion() async {
    final appSettings = await getAppSettings();
    return appSettings.lastSkippedVersion;
  }

  @override
  Future<void> saveLastSkippedVersion(String? version) async {
    final appSettings = await getAppSettings();
    final updatedSettings = appSettings.copyWith(lastSkippedVersion: version);
    await saveAppSettings(updatedSettings);
  }
}
