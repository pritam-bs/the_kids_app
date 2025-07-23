import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/domain/usecases/llm_model/model_usecase.dart';
import 'exercise_home_event.dart';
import 'exercise_home_state.dart';

@injectable
class ExerciseHomeBloc extends Bloc<ExerciseHomeEvent, ExerciseHomeState> {
  final ModelUsecase _modelUsecase;
  final String _modelFileName;
  StreamSubscription<double>? _downloadSubscription;
  String? _currentModelFileName;
  // final  = getIt<String>(instanceName: 'gemma-3n-E2B');

  ExerciseHomeBloc(this._modelUsecase, @Named('gemma-3n-E2B') this._modelFileName)
    : super(const ExerciseHomeState.initial()) {
    on<CheckModelStatus>(_onCheckModelStatus);
    on<DownloadModelRequested>(_onDownloadModelRequested);
    on<DownloadCancelled>(_onDownloadCancelled);
    on<DeleteModelRequested>(_onDeleteModelRequested);
    on<DownloadProgressUpdated>(_onDownloadProgressUpdated);
    on<DownloadCompleted>(_onDownloadCompleted);
    on<DownloadFailed>(_onDownloadFailed);
  }

  Future<void> _cancelSubscription() async {
    await _downloadSubscription?.cancel();
    _downloadSubscription = null;
  }

  Future<void> _onCheckModelStatus(
    CheckModelStatus event,
    Emitter<ExerciseHomeState> emit,
  ) async {
    _currentModelFileName = event.modelFileName;

    emit(const ExerciseHomeState.loading());
    try {
      final modelInfo = await _modelUsecase.getModelInfo(event.modelFileName);
      if (modelInfo == null) {
        emit(
          const ExerciseHomeState.failure(
            message: 'Could not retrieve model information.',
          ),
        );
        return;
      }
      emit(ExerciseHomeState.modelInfoReady(modelInfo: modelInfo));
    } catch (e) {
      emit(ExerciseHomeState.failure(message: e.toString()));
    }
  }

  Future<void> _onDownloadModelRequested(
    DownloadModelRequested event,
    Emitter<ExerciseHomeState> emit,
  ) async {
    _currentModelFileName = event.modelFileName;

    // Ensure any previous download is cancelled before starting a new one.
    await _cancelSubscription();

    emit(const ExerciseHomeState.downloading(progress: 0.0));

    try {
      final progressStream = await _modelUsecase.download(
        modelFileName: event.modelFileName,
      );

      _downloadSubscription = progressStream.listen(
        (progress) {
          add(ExerciseHomeEvent.downloadProgressUpdated(progress: progress));
        },
        onError: (error) {
          add(ExerciseHomeEvent.downloadFailed(error: error));
        },
        onDone: () {
          add(const ExerciseHomeEvent.downloadCompleted());
        },
        cancelOnError: true,
      );
    } catch (e) {
      emit(
        ExerciseHomeState.failure(
          message: 'Failed to start download: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onDownloadCancelled(
    DownloadCancelled event,
    Emitter<ExerciseHomeState> emit,
  ) async {
    AppLogger.d('Cancelling download for ${event.modelFileName}');

    // First, stop listening to the stream.
    await _cancelSubscription();

    // Then, tell the use case to cancel the underlying task.
    _modelUsecase.cancelDownload(event.modelFileName);

    // Finally, refresh the UI to show the correct state.
    add(CheckModelStatus(modelFileName: event.modelFileName));
  }

  Future<void> _onDeleteModelRequested(
    DeleteModelRequested event,
    Emitter<ExerciseHomeState> emit,
  ) async {
    emit(const ExerciseHomeState.loading());
    try {
      await _modelUsecase.delete(event.modelFileName);
      // After deleting, refresh the UI.
      add(CheckModelStatus(modelFileName: event.modelFileName));
    } catch (e) {
      emit(ExerciseHomeState.failure(message: e.toString()));
    }
  }

  void _onDownloadProgressUpdated(
    DownloadProgressUpdated event,
    Emitter<ExerciseHomeState> emit,
  ) {
    emit(ExerciseHomeState.downloading(progress: event.progress));
  }

  Future<void> _onDownloadCompleted(
    DownloadCompleted event,
    Emitter<ExerciseHomeState> emit,
  ) async {
    AppLogger.d('Download stream completed.');
    await _cancelSubscription();
    if (_currentModelFileName != null) {
      add(CheckModelStatus(modelFileName: _currentModelFileName!));
    } else {
      // This is an edge case, but good to handle.
      emit(
        const ExerciseHomeState.failure(
          message: 'Internal Error: Model name was lost after download.',
        ),
      );
    }
  }

  Future<void> _onDownloadFailed(
    DownloadFailed event,
    Emitter<ExerciseHomeState> emit,
  ) async {
    AppLogger.e('Download failed: ${event.error}');
    await _cancelSubscription();
    emit(
      ExerciseHomeState.failure(
        message: 'Download failed: ${event.error.toString()}',
      ),
    );
  }

  @override
  Future<void> close() {
    _cancelSubscription();
    return super.close();
  }
}
