import 'package:freezed_annotation/freezed_annotation.dart';

part 'learn_word_event.freezed.dart';

@freezed
sealed class LearnWordEvent with _$LearnWordEvent {
  const factory LearnWordEvent.initialize(String categoryId) = Initialize;
  const factory LearnWordEvent.fetchImageUrl({
    required String categoryId,
    required String wordId,
  }) = FetchImageUrl;
  const factory LearnWordEvent.changeWord(int newIndex) = ChangeWord;
  const factory LearnWordEvent.wordLearned(String word, String categoryId) =
      WordLearned;
}
