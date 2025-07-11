import 'package:the_kids_app/src/data/dtos/learning_category/learning_category_dto.dart';
import 'package:the_kids_app/src/domain/entities/learning_category/learning_category_entity.dart';

extension LearningCategoryMapper on LearningCategoryDto {
  LearningCategoryEntity toEntity() => LearningCategoryEntity(
    id: id,
    nameDe: nameDe,
    nameEn: nameEn,
    descriptionDe: descriptionDe,
    descriptionEn: descriptionEn,
    iconName: iconName,
    subcategories:
        subcategories?.map((subDto) => subDto.toEntity()).toList() ?? [],
  );
}

extension LearningCategoryListMapper on List<LearningCategoryDto> {
  List<LearningCategoryEntity> toEntityList() {
    return map((dto) => dto.toEntity()).toList();
  }
}
