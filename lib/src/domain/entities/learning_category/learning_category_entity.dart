import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_category_entity.freezed.dart';

@freezed
abstract class LearningCategoryEntity with _$LearningCategoryEntity {
  const factory LearningCategoryEntity({
    required String id,
    required String nameDe,
    required String nameEn,
    required String descriptionDe,
    required String descriptionEn,
    required String iconName,
    required List<LearningCategoryEntity> subcategories,
  }) = _LearningCategoryEntity;
}
