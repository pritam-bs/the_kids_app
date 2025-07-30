import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/domain/usecases/exercise_store/exercise_store_usecase.dart';
import 'package:the_kids_app/src/presentation/features/exercise/bloc/exercise_event.dart';
import 'package:the_kids_app/src/presentation/features/exercise/bloc/exercise_state.dart';

@injectable
class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseStoreUseCase _exerciseUseCase;
  final maxNumberOfExercises = 10;

  int _correctAnswers = 0;
  int _wrongAnswers = 0;
  int _totalQuestions = 0;

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

      final shuffledExercises = shuffleAndTake(exercises, maxNumberOfExercises);
      _totalQuestions = shuffledExercises.length;
      _correctAnswers = 0;
      _wrongAnswers = 0;

      emit(ExerciseState.loaded(exercises: shuffledExercises, currentIndex: 0));
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
        if (event.isCorrect) {
          _correctAnswers++;
          AppLogger.d('Answer correct! Playing correct sound and haptic.');
        } else {
          _wrongAnswers++;
          AppLogger.d('Answer wrong! Playing wrong sound and haptic.');
        }

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

        if (currentIndex == exercises.length - 1) {
          emit(
            ExerciseState.sessionCompleted(
              correctAnswers: _correctAnswers,
              wrongAnswers: _wrongAnswers,
              skippedQuestions: _totalQuestions - _correctAnswers - _wrongAnswers,
              totalQuestions: _totalQuestions,
            ),
          );
        }
      },
    );
  }

  List<ExerciseEntity> shuffleAndTake(
    List<ExerciseEntity> originalExercises,
    int count,
  ) {
    List<ExerciseEntity> shuffledExercises = List.from(originalExercises);

    shuffledExercises.shuffle(Random());

    if (shuffledExercises.length > count) {
      return shuffledExercises.sublist(0, count);
    } else {
      return shuffledExercises;
    }
  }
}
