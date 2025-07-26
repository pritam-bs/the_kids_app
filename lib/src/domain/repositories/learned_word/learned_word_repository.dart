import 'package:the_kids_app/src/domain/entities/learned_word/learned_word_entity.dart';

abstract class LearnedWordRepository {
  Future<void> addWord(LearnedWordEntity wordEntity);
  Future<LearnedWordEntity?> getWord(String word);
  Future<List<LearnedWordEntity>> getAllWords();
  Future<void> incrementSeenCount(String word);
  Future<void> incrementExerciseCount(String word);
  Future<void> removeWord(String word);
}
