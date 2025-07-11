import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_kids_app/src/domain/entities/learning_word/word_entity.dart';

part 'learn_word_state.freezed.dart';

@freezed
sealed class LearnWordState with _$LearnWordState {
  const factory LearnWordState.initial() = Initial;
  const factory LearnWordState.loading() = Loading;
  const factory LearnWordState.initialError(String message) = InitialError;
  const factory LearnWordState.loaded({
    required List<WordEntity> wordList,
    @Default(0) int currentWordIndex,
    String? currentImageUrl,
  }) = Loaded;
}
