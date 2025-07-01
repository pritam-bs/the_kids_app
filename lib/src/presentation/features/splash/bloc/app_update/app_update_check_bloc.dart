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
  ) : super(const Initial()) {
    on<Initialize>(_onInitialize);
    on<CheckForUpdate>(_onCheckForUpdate);
    on<SkipCheckForUpdate>(_onSkipCheckForUpdate);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<AppUpdateCheckState> emit,
  ) async {
    emit(Initial());
  }

  Future<void> _onCheckForUpdate(
    CheckForUpdate event,
    Emitter<AppUpdateCheckState> emit,
  ) async {
    await _checkForUpdate(emit);
  }

  Future<void> _onSkipCheckForUpdate(
    SkipCheckForUpdate event,
    Emitter<AppUpdateCheckState> emit,
  ) async {
    emit(UpdateSkipped());
  }

  Future<void> _checkForUpdate(Emitter<AppUpdateCheckState> emit) async {
    try {
      final appUpdateInfo = await _checkAppUpdateUseCase.execute();
      final lastSkippedVersion = await _getLastSkippedVersionUseCase.execute();
      if (lastSkippedVersion != null &&
          appUpdateInfo.latestVersion == lastSkippedVersion) {
        emit(UpdateSkipped());
      } else if (appUpdateInfo.shouldForceUpdate ||
          appUpdateInfo.shouldRecommendUpdate) {
        emit(UpdateAvailable(appUpdateInfo));
      } else {
        emit(UpToDate());
      }
    } catch (e) {
      AppLogger.e(e);
      emit(Error(ErrorMessages.unexpectedError));
    }
  }
}
