import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/entities/learning_category/learning_category_entity.dart';
import 'package:the_kids_app/src/domain/repositories/learning_category/learning_category_repository.dart';

@injectable
class LearningCategoryUsecase {
  final LearningCategoryRepository repository;

  LearningCategoryUsecase(this.repository);

  Future<List<LearningCategoryEntity>> fetch() async {
    return await repository.getLearningCategory();
  }
}
