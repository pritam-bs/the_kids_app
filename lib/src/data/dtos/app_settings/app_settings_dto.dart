// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings_dto.freezed.dart';
part 'app_settings_dto.g.dart';

@freezed
abstract class AppSettingsDto with _$AppSettingsDto {
  factory AppSettingsDto({
    @JsonKey(name: 'last_skipped_version') String? lastSkippedVersion,
  }) = _AppSettingsDto;

  factory AppSettingsDto.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsDtoFromJson(json);
}
