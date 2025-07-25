import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_update_info_dto.freezed.dart';
part 'app_update_info_dto.g.dart';

@freezed
abstract class AppUpdateInfoDto with _$AppUpdateInfoDto {
  const factory AppUpdateInfoDto({
    required String minimumSupportedVersion,
    required String latestVersion,
    required String releaseNotes,
    required String? storeUrl,
  }) = _AppUpdateInfoDto;

  factory AppUpdateInfoDto.fromJson(Map<String, dynamic> json) =>
      _$AppUpdateInfoDtoFromJson(json);
}
