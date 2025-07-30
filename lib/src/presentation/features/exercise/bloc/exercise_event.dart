import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart';

part 'exercise_event.freezed.dart';

@freezed
sealed class ExerciseEvent with _$ExerciseEvent {
  const factory ExerciseEvent.initializeExercises({
    required ExerciseType exerciseType,
  }) = InitializeExercises;
  const factory ExerciseEvent.changeExercise(int newIndex) = ChangeExercise;
  const factory ExerciseEvent.exerciseAnswered({
    required bool isCorrect,
    required ExerciseType exerciseType,
  }) = ExerciseAnswered;
  const factory ExerciseEvent.clearAnswerFeedback() = ClearAnswerFeedback;
  const factory ExerciseEvent.showResult() = ShowResult;
}
