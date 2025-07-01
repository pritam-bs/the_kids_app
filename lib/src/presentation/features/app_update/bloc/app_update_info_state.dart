import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_kids_app/src/domain/entities/app_update/app_update_info_entity.dart';

part 'app_update_info_state.freezed.dart';

@freezed
class AppUpdateInfoState with _$AppUpdateInfoState {
  const factory AppUpdateInfoState.initial() = Initial;
  const factory AppUpdateInfoState.updateInfo({
    required AppUpdateInfoEntity appUpdateInfo,
  }) = UpdateInfo;
  const factory AppUpdateInfoState.updateSkipped() = UpdateSkipped;
  const factory AppUpdateInfoState.error({required String message}) = Error;
}
