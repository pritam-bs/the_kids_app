import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/domain/errors/messages/error_messages.dart';
import 'package:the_kids_app/src/domain/usecases/app_settings/app_local_settings_usecase.dart';
import 'package:the_kids_app/src/domain/usecases/app_update/check_app_update_usecase.dart';
import 'package:the_kids_app/src/presentation/features/splash/bloc/app_update/app_update_check_event.dart';
import 'package:the_kids_app/src/presentation/features/splash/bloc/app_update/app_update_check_state.dart';

@injectable
class AppUpdateCheckBloc
    extends Bloc<AppUpdateCheckEvent, AppUpdateCheckState> {
  final CheckAppUpdateUseCase _checkAppUpdateUseCase;
  final GetLastSkippedVersionUseCase _getLastSkippedVersionUseCase;

  AppUpdateCheckBloc(
    this._checkAppUpdateUseCase,
    this._getLastSkippedVersionUseCase,
  ) : super(const AppUpdateCheckState.initial()) {
    on<AppUpdateCheckEvent>(_onEvent);
  }

  Future<void> _onEvent(
    AppUpdateCheckEvent event,
    Emitter<AppUpdateCheckState> emit,
  ) async {
    switch (event) {
      case Initialize():
        emit(AppUpdateCheckState.initial());
        break;
      case CheckForUpdate():
        await _checkForUpdate(emit);
        break;
    }
  }

  Future<void> _checkForUpdate(Emitter<AppUpdateCheckState> emit) async {
    try {
      final appUpdateInfo = await _checkAppUpdateUseCase.execute();
      final lastSkippedVersion = await _getLastSkippedVersionUseCase.execute();
      if (lastSkippedVersion != null &&
          appUpdateInfo.latestVersion == lastSkippedVersion) {
        emit(AppUpdateCheckState.updateSkipped());
      } else if (appUpdateInfo.shouldForceUpdate ||
          appUpdateInfo.shouldRecommendUpdate) {
        emit(AppUpdateCheckState.updateAvailable(appUpdateInfo));
      } else {
        emit(AppUpdateCheckState.upToDate());
      }
    } catch (e) {
      AppLogger.e(e);
      emit(AppUpdateCheckState.error(ErrorMessages.unexpectedError));
    }
  }
}
