import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/domain/errors/messages/error_messages.dart';
import 'package:the_kids_app/src/domain/usecases/app_settings/app_local_settings_usecase.dart';
import 'package:the_kids_app/src/presentation/features/app_update/bloc/app_update_info_event.dart';
import 'package:the_kids_app/src/presentation/features/app_update/bloc/app_update_info_state.dart';

@injectable
class AppUpdateInfoBloc extends Bloc<AppUpdateInfoEvent, AppUpdateInfoState> {
  final SaveLastSkippedVersionUseCase _saveLastSkippedVersionUseCase;

  AppUpdateInfoBloc(this._saveLastSkippedVersionUseCase)
    : super(const AppUpdateInfoState.initial()) {
    on<OnLoadAppUpdateInfo>(_onLoadAppUpdateInfo);
    on<OnSkipUpdate>(_onUpdateSkipped);
  }

  Future<void> _onLoadAppUpdateInfo(
    OnLoadAppUpdateInfo event,
    Emitter<AppUpdateInfoState> emit,
  ) async {
    emit(UpdateInfo(appUpdateInfo: event.appUpdateInfo));
  }

  Future<void> _onUpdateSkipped(
    OnSkipUpdate event,
    Emitter<AppUpdateInfoState> emit,
  ) async {
    try {
      await _saveLastSkippedVersionUseCase.execute(event.version);
      emit(const UpdateSkipped());
    } on Exception catch (e) {
      AppLogger.e(e);
      emit(Error(message: ErrorMessages.unexpectedError));
    }
  }
}
