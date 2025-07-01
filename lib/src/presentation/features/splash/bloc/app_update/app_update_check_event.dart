import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_update_check_event.freezed.dart';

@freezed
sealed class AppUpdateCheckEvent with _$AppUpdateCheckEvent {
  const factory AppUpdateCheckEvent.initialize() = Initialize;
  const factory AppUpdateCheckEvent.checkForUpdate() = CheckForUpdate;
}
