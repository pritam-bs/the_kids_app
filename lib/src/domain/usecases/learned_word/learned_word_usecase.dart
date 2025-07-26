import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/entities/learned_word/learned_word_entity.dart';
import 'package:the_kids_app/src/domain/repositories/learned_word/learned_word_repository.dart';

@injectable
class LearnedWordUsecase {
  final LearnedWordRepository _learnedWordRepository;

  LearnedWordUsecase(this._learnedWordRepository);

  Future<void> addWord(LearnedWordEntity learnedWord) async {
    await _learnedWordRepository.addWord(learnedWord);
  }

  Future<void> incrementSeenCount(String learnedWord) async {
    await _learnedWordRepository.incrementSeenCount(learnedWord);
  }

  Future<List<LearnedWordEntity>> getAllLearnedWords() async {
    final allWords = await _learnedWordRepository.getAllWords();
    return allWords;
  }
}
