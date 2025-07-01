// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_update_info_dto.freezed.dart';
part 'app_update_info_dto.g.dart';

@freezed
abstract class AppUpdateInfoDTO with _$AppUpdateInfoDTO {
  const factory AppUpdateInfoDTO({
    @JsonKey(name: 'minimum_supported_version')
    required String minimumSupportedVersion,
    @JsonKey(name: 'latest_version') required String latestVersion,
    @JsonKey(name: 'release_notes') required String releaseNotes,
    @JsonKey(name: 'store_url') required String? storeUrl,
  }) = _AppUpdateInfoDTO;

  factory AppUpdateInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$AppUpdateInfoDTOFromJson(json);
}
