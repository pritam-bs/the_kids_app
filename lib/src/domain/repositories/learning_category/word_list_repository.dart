import 'package:the_kids_app/src/domain/entities/learning_word/word_entity.dart';

abstract class WordListRepository {
  Future<List<WordEntity>> getWordList(String id);
}
