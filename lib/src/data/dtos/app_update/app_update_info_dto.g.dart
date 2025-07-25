// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_update_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUpdateInfoDto _$AppUpdateInfoDtoFromJson(Map<String, dynamic> json) =>
    _AppUpdateInfoDto(
      minimumSupportedVersion: json['minimumSupportedVersion'] as String,
      latestVersion: json['latestVersion'] as String,
      releaseNotes: json['releaseNotes'] as String,
      storeUrl: json['storeUrl'] as String?,
    );

Map<String, dynamic> _$AppUpdateInfoDtoToJson(_AppUpdateInfoDto instance) =>
    <String, dynamic>{
      'minimumSupportedVersion': instance.minimumSupportedVersion,
      'latestVersion': instance.latestVersion,
      'releaseNotes': instance.releaseNotes,
      'storeUrl': instance.storeUrl,
    };
