import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/domain/usecases/exercise_store/exercise_store_usecase.dart';
import 'package:the_kids_app/src/presentation/features/exercise/bloc/exercise_event.dart';
import 'package:the_kids_app/src/presentation/features/exercise/bloc/exercise_state.dart';

@injectable
class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseStoreUseCase _exerciseUseCase;
  final numberOfExercises = 10;

  ExerciseBloc(this._exerciseUseCase) : super(const ExerciseState.initial()) {
    on<InitializeExercises>(_onInitializeExercises);
    on<ChangeExercise>(_onChangeExercise);
    on<ExerciseAnswered>(_onExerciseAnswered);
    on<ClearAnswerFeedback>(_onClearAnswerFeedback);
  }

  Future<void> _onInitializeExercises(
    InitializeExercises event,
    Emitter<ExerciseState> emit,
  ) async {
    emit(const ExerciseState.loading());
    try {
      final List<ExerciseEntity> exercises = await _exerciseUseCase(
        type: event.exerciseType,
      );
      emit(ExerciseState.loaded(exercises: exercises, currentIndex: 0));
    } catch (e) {
      emit(ExerciseState.error('Failed to generate exercises: $e'));
    }
  }

  Future<void> _onChangeExercise(
    ChangeExercise event,
    Emitter<ExerciseState> emit,
  ) async {
    state.whenOrNull(
      loaded: (exercises, currentIndex, _, _) {
        final newIndex = event.newIndex;
        if (newIndex >= 0 && newIndex < exercises.length) {
          emit(
            ExerciseState.loaded(
              exercises: exercises,
              currentIndex: newIndex,
              lastAnswerCorrect: null,
              feedbackAnimationTrigger: 0,
            ),
          );
        }
      },
    );
  }

  Future<void> _onExerciseAnswered(
    ExerciseAnswered event,
    Emitter<ExerciseState> emit,
  ) async {
    state.whenOrNull(
      loaded: (exercises, currentIndex, _, feedbackAnimationTrigger) {
        emit(
          ExerciseState.loaded(
            exercises: exercises,
            currentIndex: currentIndex,
            lastAnswerCorrect: event.isCorrect,
            feedbackAnimationTrigger: feedbackAnimationTrigger + 1,
          ),
        );
      },
    );
  }

  void _onClearAnswerFeedback(
    ClearAnswerFeedback event,
    Emitter<ExerciseState> emit,
  ) {
    state.whenOrNull(
      loaded: (exercises, currentIndex, _, feedbackAnimationTrigger) {
        // Only clear if there's feedback to clear
        if (state is Loaded && (state as Loaded).lastAnswerCorrect != null) {
          emit(
            ExerciseState.loaded(
              exercises: exercises,
              currentIndex: currentIndex,
              lastAnswerCorrect: null, // Clear feedback
              feedbackAnimationTrigger:
                  feedbackAnimationTrigger, // Keep trigger same
            ),
          );
        }
      },
    );
  }
}
