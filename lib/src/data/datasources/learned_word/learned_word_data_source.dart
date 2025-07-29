import 'package:the_kids_app/src/data/dtos/learned_word/learned_word_dto.dart';

abstract class LearnedWordDataSource {
  Future<void> insertWord(LearnedWordDto learnedWordDto);
  Future<LearnedWordDto?> getWord(String word);
  Future<List<LearnedWordDto>> getAllWords();
  Future<void> updateSeenCount(String word, int newCount);
  Future<void> updateExerciseCount(String word, int newCount);
  
  // Methods for updating individual exercise generation flags
  Future<void> updateMatchWordGenerated(String word, bool isGenerated);
  Future<void> updateListenChooseGenerated(String word, bool isGenerated);
  Future<void> updateSpellWordGenerated(String word, bool isGenerated);
  Future<void> updateSentenceScrambleGenerated(String word, bool isGenerated);

  Future<void> deleteWord(String word);
  Stream<LearnedWordDto> get onNewWordAdded;
}
