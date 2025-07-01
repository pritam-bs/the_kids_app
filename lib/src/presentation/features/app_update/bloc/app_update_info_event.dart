import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_kids_app/src/domain/entities/app_update/app_update_info_entity.dart';

part 'app_update_info_event.freezed.dart';

@freezed
sealed class AppUpdateInfoEvent with _$AppUpdateInfoEvent {
  const factory AppUpdateInfoEvent.onLoadAppUpdateInfo({
    required AppUpdateInfoEntity appUpdateInfo,
  }) = OnLoadAppUpdateInfo;
  const factory AppUpdateInfoEvent.onSkipUpdate(String version) = OnSkipUpdate;
}
