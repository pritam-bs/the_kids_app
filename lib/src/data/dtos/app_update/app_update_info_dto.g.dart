// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_update_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUpdateInfoDTO _$AppUpdateInfoDTOFromJson(Map<String, dynamic> json) =>
    _AppUpdateInfoDTO(
      minimumSupportedVersion: json['minimum_supported_version'] as String,
      latestVersion: json['latest_version'] as String,
      releaseNotes: json['release_notes'] as String,
      storeUrl: json['store_url'] as String?,
    );

Map<String, dynamic> _$AppUpdateInfoDTOToJson(_AppUpdateInfoDTO instance) =>
    <String, dynamic>{
      'minimum_supported_version': instance.minimumSupportedVersion,
      'latest_version': instance.latestVersion,
      'release_notes': instance.releaseNotes,
      'store_url': instance.storeUrl,
    };
