import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/data/datasources/learned_word/learned_word_data_source.dart';
import 'package:the_kids_app/src/data/mappers/learned_word/learned_word_mapper.dart';
import 'package:the_kids_app/src/domain/entities/learned_word/learned_word_entity.dart';
import 'package:the_kids_app/src/domain/repositories/learned_word/learned_word_repository.dart';

class LearnedWordRepositoryImpl implements LearnedWordRepository {
  final LearnedWordDataSource _dataSource;

  LearnedWordRepositoryImpl(this._dataSource);

  @override
  Future<void> addWord(LearnedWordEntity wordEntity) async {
    final wordDto = wordEntity.toDto();
    await _dataSource.insertWord(wordDto);
  }

  @override
  Future<void> incrementSeenCount(String word) async {
    final existingWordDto = await _dataSource.getWord(word);
    if (existingWordDto != null) {
      final updatedSeenCount = existingWordDto.seenCount + 1;
      final updatedWordDto = existingWordDto.copyWith(
        seenCount: updatedSeenCount,
      );
      await _dataSource.insertWord(updatedWordDto);
    } else {
      AppLogger.d('Cannot increment seen count: Word "$word" not found.');
    }
  }

  @override
  Future<void> incrementExerciseCount(String word) async {
    final existingWordDto = await _dataSource.getWord(word);
    if (existingWordDto != null) {
      final updatedexErciseCount = existingWordDto.exerciseCount + 1;
      final updatedWordDto = existingWordDto.copyWith(
        exerciseCount: updatedexErciseCount,
      );
      await _dataSource.insertWord(
        updatedWordDto,
      );
    } else {
      AppLogger.d('Cannot increment exercise count: Word "$word" not found.');
    }
  }

  @override
  Future<void> removeWord(String word) async {
    await _dataSource.deleteWord(word);
  }

  @override
  Future<LearnedWordEntity?> getWord(String word) async {
    final dto = await _dataSource.getWord(word);
    return dto?.toEntity();
  }

  @override
  Future<List<LearnedWordEntity>> getAllWords() async {
    final dtos = await _dataSource.getAllWords();
    return dtos.map((dto) => dto.toEntity()).toList();
  }
}
