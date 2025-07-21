import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/domain/entities/learning_word/word_entity.dart';
import 'package:the_kids_app/src/presentation/features/exercise/bloc/exercise_event.dart';
import 'package:the_kids_app/src/presentation/features/exercise/bloc/exercise_state.dart';

@injectable
class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseBloc() : super(const ExerciseState.initial()) {
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
      // --- Dummy Data Generation ---
      // In a real app, this would come from your backend or a data source.
      // We'll create a list of different exercise data types.
      final List<ExerciseEntity> dummyExercises = [
        ExerciseEntity.matchWord(
          targetGermanWord: 'Mutter',
          englishOptions: ['Father', 'Mother', 'Sister'], // Example options
          correctEnglishWord: 'Mother',
        ),
        ExerciseEntity.listenChoose(
          targetGermanWord: 'Hund',
          germanOptions: ['Hund', 'Katze', 'Vogel'], // German options
        ),
        ExerciseEntity.spellWord(
          targetGermanWord: 'Apfel',
          scrambledLetters: ['A', 'p', 'f', 'e', 'l', 'x', 'z'],
        ),
        ExerciseEntity.sentenceScramble(
          scrambledSentenceDe: 'ist / Das / Buch / ein',
          correctSentenceEn: 'That is a book.',
        ),
        ExerciseEntity.buildSentence(
          availableWords: ['Ich', 'habe', 'einen', 'Hund'],
          targetSentenceEn: 'I have a dog.',
        ),
      ];

      if (dummyExercises.isEmpty) {
        emit(const ExerciseState.error('No exercises defined.'));
        return;
      }
      emit(ExerciseState.loaded(exercises: dummyExercises, currentIndex: 0));
    } catch (e) {
      emit(ExerciseState.error('Failed to load exercises: $e'));
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
