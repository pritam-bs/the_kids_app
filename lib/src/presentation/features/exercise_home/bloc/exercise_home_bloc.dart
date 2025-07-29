import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/domain/errors/messages/error_messages.dart';
import 'package:the_kids_app/src/domain/usecases/exercise_generator/exercise_generator_usecase.dart';
import 'package:the_kids_app/src/domain/usecases/llm_model/model_usecase.dart';
import 'exercise_home_event.dart';
import 'exercise_home_state.dart';

@injectable
class ExerciseHomeBloc extends Bloc<ExerciseHomeEvent, ExerciseHomeState> {
  final ModelUsecase _modelUsecase;
  final ExerciseGeneratorUsecase _exerciseGeneratorUsecase;
  StreamSubscription<double>? _downloadSubscription;

  ExerciseHomeBloc(this._modelUsecase, this._exerciseGeneratorUsecase)
    : super(const ExerciseHomeState.initial()) {
    on<CheckModelStatus>(_onCheckModelStatus);
    on<DownloadModelRequested>(_onDownloadModelRequested);
    on<DownloadCancelled>(_onDownloadCancelled);
    on<DeleteModelRequested>(_onDeleteModelRequested);
    on<DownloadProgressUpdated>(_onDownloadProgressUpdated);
    on<DownloadCompleted>(_onDownloadCompleted);
    on<DownloadFailed>(_onDownloadFailed);
  }

  // Cancels any existing stream subscription to prevent memory leaks.
  Future<void> _cancelSubscription() async {
    await _downloadSubscription?.cancel();
    _downloadSubscription = null;
  }

  // The main entry point for the BLoC. It now intelligently decides
  // whether to reattach to an existing download or check for a completed file.
  Future<void> _onCheckModelStatus(
    CheckModelStatus event,
    Emitter<ExerciseHomeState> emit,
  ) async {
    emit(const ExerciseHomeState.loading());
    try {
      // Check if a download is already in progress.
      final bool isInProgress = await _modelUsecase
          .isModelDownloadedInProgress();

      if (isInProgress) {
        // If it is, reattach to its progress stream.
        AppLogger.i('Download is already in progress. Reattaching...');
        await _listenToDownloadStream(
          _modelUsecase.reattachModelDownloading(),
          emit,
        );
      } else {
        // If not in progress, check if the file is already downloaded.
        AppLogger.i(
          'No download in progress. Checking for existing model file.',
        );
        final modelInfo = await _modelUsecase.getModelInfo();
        if (modelInfo == null) {
          emit(
            const ExerciseHomeState.failure(
              message: ErrorMessages.unexpectedError,
            ),
          );
          return;
        }
        emit(ExerciseHomeState.modelInfoReady(modelInfo: modelInfo));
      }
    } catch (e) {
      emit(ExerciseHomeState.failure(message: e.toString()));
    }
  }

  // Handles the request to start a brand new download.
  Future<void> _onDownloadModelRequested(
    DownloadModelRequested event,
    Emitter<ExerciseHomeState> emit,
  ) async {
    AppLogger.i('New model download requested.');
    await _listenToDownloadStream(_modelUsecase.download(), emit);
  }

  // A helper method to listen to a download stream, whether it's new or reattached.
  Future<void> _listenToDownloadStream(
    Future<Stream<double>> streamFuture,
    Emitter<ExerciseHomeState> emit,
  ) async {
    await _cancelSubscription();
    emit(const ExerciseHomeState.downloading(progress: 0.0));
    try {
      final progressStream = await streamFuture;
      _downloadSubscription = progressStream.listen(
        (progress) => add(DownloadProgressUpdated(progress: progress)),
        onError: (error) => add(DownloadFailed(error: error)),
        onDone: () => add(const DownloadCompleted()),
        cancelOnError: true,
      );
    } catch (e) {
      add(DownloadFailed(error: e));
    }
  }

  Future<void> _onDownloadCancelled(
    DownloadCancelled event,
    Emitter<ExerciseHomeState> emit,
  ) async {
    AppLogger.d('Cancelling model download');
    await _cancelSubscription();
    _modelUsecase.cancelDownload();
    // After cancellation, re-run the check to update the UI to the correct state.
    add(CheckModelStatus());
  }

  Future<void> _onDeleteModelRequested(
    DeleteModelRequested event,
    Emitter<ExerciseHomeState> emit,
  ) async {
    emit(const ExerciseHomeState.loading());
    try {
      await _modelUsecase.delete();
      add(CheckModelStatus());
    } catch (e) {
      emit(ExerciseHomeState.failure(message: e.toString()));
    }
  }

  void _onDownloadProgressUpdated(
    DownloadProgressUpdated event,
    Emitter<ExerciseHomeState> emit,
  ) {
    // Only update state if we are currently in a downloading state.
    if (state is Downloading) {
      emit(ExerciseHomeState.downloading(progress: event.progress));
    }
  }

  Future<void> _onDownloadCompleted(
    DownloadCompleted event,
    Emitter<ExerciseHomeState> emit,
  ) async {
    AppLogger.d('Download stream completed successfully.');
    await _cancelSubscription();
    // After any download completes, always re-check the status to get the final model info.
    add(CheckModelStatus());

    await _exerciseGeneratorUsecase.handleModelDownloadCompletion();
  }

  Future<void> _onDownloadFailed(
    DownloadFailed event,
    Emitter<ExerciseHomeState> emit,
  ) async {
    AppLogger.e('Download failed: ${event.error}');
    await _cancelSubscription();
    emit(
      const ExerciseHomeState.failure(message: ErrorMessages.unexpectedError),
    );
  }

  @override
  Future<void> close() {
    _cancelSubscription();
    return super.close();
  }
}
