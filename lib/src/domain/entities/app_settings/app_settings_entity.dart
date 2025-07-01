import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings_entity.freezed.dart';

@freezed
abstract class AppSettingsEntity with _$AppSettingsEntity {
  factory AppSettingsEntity({String? lastSkippedVersion}) = _AppSettingsEntity;
}
