import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';

part 'exercise_state.freezed.dart';

@freezed
sealed class ExerciseState with _$ExerciseState {
  const factory ExerciseState.initial() = Initial;
  const factory ExerciseState.loading() = Loading;
  const factory ExerciseState.error(String message) = Error;
  const factory ExerciseState.loaded({
    required List<ExerciseEntity> exercises,
    @Default(0) int currentIndex,
    bool? lastAnswerCorrect,
    @Default(0) int feedbackAnimationTrigger,
  }) = Loaded;
  const factory ExerciseState.sessionCompleted({
    required int correctAnswers,
    required int wrongAnswers,
    required int skippedQuestions,
    required int totalQuestions,
  }) = SessionCompleted;
}
