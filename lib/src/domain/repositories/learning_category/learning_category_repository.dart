import 'package:the_kids_app/src/domain/entities/learning_category/learning_category_entity.dart';

abstract class LearningCategoryRepository {
  Future<List<LearningCategoryEntity>> getLearningCategory();
}
