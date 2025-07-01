import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_kids_app/src/domain/entities/app_update/app_update_info_entity.dart';

part 'app_update_check_state.freezed.dart';

@freezed
sealed class AppUpdateCheckState with _$AppUpdateCheckState {
  const factory AppUpdateCheckState.initial() = Initial;
  const factory AppUpdateCheckState.error(String message) = Error;
  const factory AppUpdateCheckState.upToDate() = UpToDate;
  const factory AppUpdateCheckState.updateSkipped() = UpdateSkipped;
  const factory AppUpdateCheckState.updateAvailable(
    AppUpdateInfoEntity appUpdateInfo,
  ) = UpdateAvailable;
}
