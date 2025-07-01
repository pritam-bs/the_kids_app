import 'package:the_kids_app/src/data/dtos/app_settings/app_settings_dto.dart';
import 'package:the_kids_app/src/domain/entities/app_settings/app_settings_entity.dart';

extension AppSettingsDtoMapper on AppSettingsDto {
  AppSettingsEntity toDomain() {
    return AppSettingsEntity(lastSkippedVersion: lastSkippedVersion);
  }
}

extension AppSettingsEntityMapper on AppSettingsEntity {
  AppSettingsDto toDto() {
    return AppSettingsDto(lastSkippedVersion: lastSkippedVersion);
  }
}
