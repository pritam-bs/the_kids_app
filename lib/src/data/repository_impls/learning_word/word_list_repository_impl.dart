import 'package:flutter/services.dart';
import 'package:the_kids_app/src/data/dtos/learning_word/word_dto.dart';
import 'package:the_kids_app/src/data/mappers/learning_word/word_mapper.dart';
import 'package:the_kids_app/src/domain/entities/learning_word/word_entity.dart';
import 'package:the_kids_app/src/domain/repositories/learning_category/word_list_repository.dart';

import '../../../core/config/logging_config.dart';

class WordListRepositoryImpl implements WordListRepository {
  @override
  Future<List<WordEntity>> getWordList(String id) async {
    try {
      final jsonString = await rootBundle.loadString('assets/json/$id.json');

      final dtoList = wordListDtoFromJson(jsonString);

      return dtoList.toEntityList();
    } on Exception catch (e) {
      AppLogger.e(e);
      throw (ArgumentError('Failed to parse word_list json'));
    }
  }
}
