import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/domain/usecases/exercise/exercise_usecase.dart';
import 'package:the_kids_app/src/presentation/features/exercise/bloc/exercise_event.dart';
import 'package:the_kids_app/src/presentation/features/exercise/bloc/exercise_state.dart';

@injectable
class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseUseCase _exerciseUseCase;
  final numberOfExercises = 5;

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
        numberOfExercises: numberOfExercises,
        contextWords: [],
      );
      emit(
        ExerciseState.loaded(exercises: exercises, currentIndex: 0),
      );
    } catch (e) {
      emit(ExerciseState.error('Failed to generate exercises: $e'));
    }
    // try {
    //   // --- Dummy Data Generation ---
    //   // In a real app, this would come from your backend or a data source.
    //   // We'll create a list of different exercise data types.
    //   final List<ExerciseEntity> dummyExercises = [
    //     // --- MatchWordExerciseEntity Examples ---
    //     ExerciseEntity.matchWord(
    //       targetGermanWord: 'Mutter',
    //       englishOptions: ['Father', 'Mother', 'Sister'],
    //       correctEnglishWord: 'Mother',
    //     ),
    //     ExerciseEntity.matchWord(
    //       targetGermanWord: 'Vater',
    //       englishOptions: ['Mother', 'Brother', 'Father'],
    //       correctEnglishWord: 'Father',
    //     ),
    //     ExerciseEntity.matchWord(
    //       targetGermanWord: 'Haus',
    //       englishOptions: ['Car', 'House', 'Tree'],
    //       correctEnglishWord: 'House',
    //     ),

    //     // --- ListenChooseExerciseEntity Examples ---
    //     ExerciseEntity.listenChoose(
    //       targetGermanWord: 'Hund',
    //       germanOptions: ['Hund', 'Katze', 'Vogel'],
    //     ),
    //     ExerciseEntity.listenChoose(
    //       targetGermanWord: 'Katze',
    //       germanOptions: ['Hund', 'Maus', 'Katze'],
    //     ),
    //     ExerciseEntity.listenChoose(
    //       targetGermanWord: 'Baum',
    //       germanOptions: ['Blume', 'Baum', 'Stein'],
    //     ),

    //     // --- SpellWordExerciseEntity Examples ---
    //     ExerciseEntity.spellWord(
    //       targetGermanWord: 'Apfel',
    //       scrambledLetters: ['A', 'p', 'f', 'e', 'l', 'x', 'z'],
    //       englishTranslation: 'Apple',
    //     ),
    //     ExerciseEntity.spellWord(
    //       targetGermanWord: 'Tisch',
    //       scrambledLetters: ['T', 'i', 's', 'c', 'h', 'k', 'l'],
    //       englishTranslation: 'Table',
    //     ),
    //     ExerciseEntity.spellWord(
    //       targetGermanWord: 'Wasser',
    //       scrambledLetters: ['W', 'a', 's', 's', 'e', 'r', 't', 'u'],
    //       englishTranslation: 'Water',
    //     ),

    //     // --- SentenceScrambleExerciseEntity Examples ---
    //     ExerciseEntity.sentenceScramble(
    //       targetGermanSentence: 'Das ist ein Buch.',
    //       englishTranslation: 'That is a book.',
    //       scrambledWords: ['ist', 'Das', 'ein', 'Buch.'],
    //     ),
    //     ExerciseEntity.sentenceScramble(
    //       targetGermanSentence: 'Ich liebe Deutsch.',
    //       englishTranslation: 'I love German.',
    //       scrambledWords: ['liebe', 'Ich', 'Deutsch.'],
    //     ),
    //     ExerciseEntity.sentenceScramble(
    //       targetGermanSentence: 'Sie trinkt Wasser.',
    //       englishTranslation: 'She drinks water.',
    //       scrambledWords: ['trinkt', 'Sie', 'Wasser.'],
    //     ),

    //     // --- BuildSentenceExerciseEntity Examples ---
    //     ExerciseEntity.buildSentence(
    //       targetGermanSentence: 'Ich habe einen Hund.',
    //       englishTranslation: 'I have a dog.',
    //       sentenceWithMissingWord: ['Ich', 'habe', 'einen', '', '.'],
    //       optionsForMissingWord: ['Katze', 'Vogel', 'Hund'],
    //       correctAnswerWord: 'Hund',
    //     ),
    //     ExerciseEntity.buildSentence(
    //       targetGermanSentence: 'Der Apfel ist rot.',
    //       englishTranslation: 'The apple is red.',
    //       sentenceWithMissingWord: ['Der', '', 'ist', 'rot.'],
    //       optionsForMissingWord: ['Banane', 'Apfel', 'Birne'],
    //       correctAnswerWord: 'Apfel',
    //     ),
    //     ExerciseEntity.buildSentence(
    //       targetGermanSentence: 'Wir spielen im Park.',
    //       englishTranslation: 'We play in the park.',
    //       sentenceWithMissingWord: ['Wir', 'spielen', '', 'Park.'],
    //       optionsForMissingWord: ['Haus', 'Garten', 'im'],
    //       correctAnswerWord: 'im',
    //     ),
    //   ];

    //   if (dummyExercises.isEmpty) {
    //     emit(const ExerciseState.error('No exercises defined.'));
    //     return;
    //   }
    //   emit(ExerciseState.loaded(exercises: dummyExercises, currentIndex: 0));
    // } catch (e) {
    //   emit(ExerciseState.error('Failed to load exercises: $e'));
    // }
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
