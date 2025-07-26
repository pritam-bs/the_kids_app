import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/domain/entities/learned_word/learned_word_entity.dart';
import 'package:the_kids_app/src/domain/entities/learning_word/word_entity.dart';
import 'package:the_kids_app/src/domain/errors/messages/error_messages.dart';
import 'package:the_kids_app/src/domain/usecases/image/image_usecase.dart';
import 'package:the_kids_app/src/domain/usecases/learned_word/learned_word_usecase.dart';
import 'package:the_kids_app/src/domain/usecases/learning_word/word_list_usecase.dart';
import 'package:the_kids_app/src/presentation/features/learn_word/bloc/learn_word_event.dart';
import 'package:the_kids_app/src/presentation/features/learn_word/bloc/learn_word_state.dart';

@Injectable()
class LearnWordBloc extends Bloc<LearnWordEvent, LearnWordState> {
  final WordListUsecase _wordListUsecase;
  final ImageUsecase _imageUsecase;
  final LearnedWordUsecase _learnedWordUsecase;
  late String categoryId;
  late List<WordEntity> wordList;

  LearnWordBloc(
    this._wordListUsecase,
    this._imageUsecase,
    this._learnedWordUsecase,
  ) : super(const Initial()) {
    on<LearnWordEvent>((event, emit) async {
      await event.map(
        initialize: (e) => _onInitialize(e, emit),
        fetchImageUrl: (e) => _onFetchImageUrl(e, emit),
        changeWord: (e) => _onChangeWord(e, emit),
      );
    });
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<LearnWordState> emit,
  ) async {
    try {
      categoryId = event.categoryId;
      wordList = await _wordListUsecase.fetch(event.categoryId);
      if (wordList.isEmpty) {
        emit(const InitialError(ErrorMessages.noLearningCategories));
        return;
      }

      emit(Loaded(wordList: wordList, currentWordIndex: 0));

      add(
        LearnWordEvent.fetchImageUrl(
          categoryId: event.categoryId,
          wordId: wordList[0].id,
        ),
      );
    } on Exception catch (e) {
      AppLogger.e(e);
      emit(InitialError(ErrorMessages.unexpectedError));
    }
  }

  Future<void> _onFetchImageUrl(
    FetchImageUrl event,
    Emitter<LearnWordState> emit,
  ) async {
    if (state is Loaded) {
      final loadedState = state as Loaded;
      try {
        final imageUrl = await _imageUsecase.getImageUrl(
          event.categoryId,
          event.wordId,
        );
        emit(loadedState.copyWith(currentImageUrl: imageUrl));
      } catch (e) {
        AppLogger.e('Error fetching image URL for ${event.wordId}: $e');
        emit(loadedState.copyWith(currentImageUrl: null));
      }
    }
  }

  Future<void> _onChangeWord(
    ChangeWord event,
    Emitter<LearnWordState> emit,
  ) async {
    if (state is Loaded) {
      final loadedState = state as Loaded;

      final newIndex = event.newIndex;

      if (newIndex >= 0 && newIndex < loadedState.wordList.length) {
        emit(
          loadedState.copyWith(
            currentWordIndex: newIndex,
            currentImageUrl: null,
          ),
        );

        add(
          LearnWordEvent.fetchImageUrl(
            categoryId: categoryId,
            wordId: loadedState.wordList[newIndex].id,
          ),
        );

        final wordEntity = wordList[newIndex];
        final learnWordEntity = LearnedWordEntity(
          word: wordEntity.wordDe,
          category: categoryId,
        );
        _learnedWordUsecase.addWord(learnWordEntity);

        final allLearnedWords = await _learnedWordUsecase.getAllLearnedWords();
        AppLogger.d(allLearnedWords);
      }
    }
  }
}
