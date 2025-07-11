import 'package:flutter/services.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/data/dtos/learning_category/learning_category_dto.dart';
import 'package:the_kids_app/src/data/mappers/learning_category_mapper/learning_category_mapper.dart';
import 'package:the_kids_app/src/domain/entities/learning_category/learning_category_entity.dart';
import 'package:the_kids_app/src/domain/repositories/learning_category/learning_category_repository.dart';

class LearningCategoryRepositoryImpl implements LearningCategoryRepository {
  @override
  Future<List<LearningCategoryEntity>> getLearningCategory() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/json/german_learning_categories.json',
      );

      final dtoList = learningCategoryListDtoFromJson(jsonString);

      return dtoList.toEntityList();
    } on Exception catch (e) {
      AppLogger.e(e);
      throw (ArgumentError('Failed to parse german_learning_categories json'));
    }
  }
}
