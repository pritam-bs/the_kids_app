import 'package:the_kids_app/src/data/dtos/learned_word/learned_word_dto.dart';

abstract class LearnedWordDataSource {
  Future<void> insertWord(LearnedWordDto learnedWordDto);
  Future<LearnedWordDto?> getWord(String word);
  Future<List<LearnedWordDto>> getAllWords();
  Future<void> updateSeenCount(String word, int newCount);
  Future<void> updateExerciseCount(String word, int newCount);
  Future<void> deleteWord(String word);
  Stream<LearnedWordDto> get onNewWordAdded;
}
