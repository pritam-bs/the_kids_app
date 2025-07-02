import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_update_info_dto.freezed.dart';
part 'app_update_info_dto.g.dart';

@freezed
abstract class AppUpdateInfoDTO with _$AppUpdateInfoDTO {
  const factory AppUpdateInfoDTO({
    required String minimumSupportedVersion,
    required String latestVersion,
    required String releaseNotes,
    required String? storeUrl,
  }) = _AppUpdateInfoDTO;

  factory AppUpdateInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$AppUpdateInfoDTOFromJson(json);
}
