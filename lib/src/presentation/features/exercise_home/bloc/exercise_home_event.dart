import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_home_event.freezed.dart';

@freezed
sealed class ExerciseHomeEvent with _$ExerciseHomeEvent {
  /// Event to check the initial status of the model when the UI is first loaded.
  const factory ExerciseHomeEvent.checkModelStatus() = CheckModelStatus;

  /// Event triggered by the UI to start downloading the model.
  const factory ExerciseHomeEvent.downloadModelRequested() =
      DownloadModelRequested;

  /// Event triggered by the UI to cancel an in-progress download.
  const factory ExerciseHomeEvent.downloadCancelled() = DownloadCancelled;

  /// Event triggered by the UI to delete a downloaded model.
  const factory ExerciseHomeEvent.deleteModelRequested() = DeleteModelRequested;

  /// **Internal event** used by the BLoC to report progress updates from the stream.
  const factory ExerciseHomeEvent.downloadProgressUpdated({
    required double progress,
  }) = DownloadProgressUpdated;

  /// **Internal event** used by the BLoC when the download stream completes successfully.
  const factory ExerciseHomeEvent.downloadCompleted() = DownloadCompleted;

  /// **Internal event** used by the BLoC when the download stream reports an error.
  const factory ExerciseHomeEvent.downloadFailed({required Object error}) =
      DownloadFailed;
}
