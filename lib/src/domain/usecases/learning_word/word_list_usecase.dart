import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/entities/learning_word/word_entity.dart';
import 'package:the_kids_app/src/domain/repositories/learning_category/word_list_repository.dart';

@injectable
class WordListUsecase {
  final WordListRepository repository;

  WordListUsecase(this.repository);

  Future<List<WordEntity>> fetch(String id) async {
    return await repository.getWordList(id);
  }
}
