import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/domain/usecases/exercise_store/exercise_store_usecase.dart';
import 'package:the_kids_app/src/presentation/features/exercise/bloc/exercise_event.dart';
import 'package:the_kids_app/src/presentation/features/exercise/bloc/exercise_state.dart';

@injectable
class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseStoreUseCase _exerciseUseCase;
  final maxNumberOfExercises = 10;

  List<bool?> _answers = [];

  ExerciseBloc(this._exerciseUseCase) : super(const ExerciseState.initial()) {
    on<InitializeExercises>(_onInitializeExercises);
    on<ChangeExercise>(_onChangeExercise);
    on<ExerciseAnswered>(_onExerciseAnswered);
    on<ClearAnswerFeedback>(_onClearAnswerFeedback);
    on<ShowResult>(_showResult);
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
      _answers = List.filled(shuffledExercises.length, null);

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
        _answers[currentIndex] = event.isCorrect;

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

  Future<void> _onClearAnswerFeedback(
    ClearAnswerFeedback event,
    Emitter<ExerciseState> emit,
  ) async {
    state.whenOrNull(
      loaded: (exercises, currentIndex, _, feedbackAnimationTrigger) async {
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

  Future<void> _showResult(
    ShowResult event,
    Emitter<ExerciseState> emit,
  ) async {
    state.whenOrNull(
      loaded: (exercises, currentIndex, _, _) async {
        if (currentIndex == exercises.length - 1) {
          int correctAnswers = 0;
          int wrongAnswers = 0;
          int skippedQuestions = 0;

          for (var answer in _answers) {
            if (answer == true) {
              correctAnswers++;
            } else if (answer == false) {
              wrongAnswers++;
            } else {
              skippedQuestions++;
            }
          }

          emit(
            ExerciseState.sessionCompleted(
              correctAnswers: correctAnswers,
              wrongAnswers: wrongAnswers,
              skippedQuestions: skippedQuestions,
              totalQuestions: exercises.length,
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
