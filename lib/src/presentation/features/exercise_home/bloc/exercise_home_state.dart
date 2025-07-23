import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_kids_app/src/domain/entities/llm_model/model_info_entity.dart';

part 'exercise_home_state.freezed.dart';

@freezed
sealed class ExerciseHomeState with _$ExerciseHomeState {
  /// The initial state before any action has been taken.
  const factory ExerciseHomeState.initial() = _Initial;

  /// State while checking model status or deleting a model.
  const factory ExerciseHomeState.loading() = _Loading;

  /// The stable state where the model's status is known.
  /// The UI can use `modelInfo.isDownloaded` to decide what to show.
  const factory ExerciseHomeState.modelInfoReady({
    required ModelInfoEntity modelInfo,
  }) = ModelInfoReady;

  /// State when the model is actively being downloaded.
  const factory ExerciseHomeState.downloading({required double progress}) =
      Downloading;

  /// State representing any failure during the process.
  const factory ExerciseHomeState.failure({required String message}) = Failure;
}
