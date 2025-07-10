// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LearningCategoryDto _$LearningCategoryDtoFromJson(Map<String, dynamic> json) =>
    _LearningCategoryDto(
      nameDe: json['nameDe'] as String,
      nameEn: json['nameEn'] as String,
      descriptionDe: json['descriptionDe'] as String,
      descriptionEn: json['descriptionEn'] as String,
      iconName: json['iconName'] as String,
      subcategories: (json['subcategories'] as List<dynamic>?)
          ?.map((e) => LearningCategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LearningCategoryDtoToJson(
  _LearningCategoryDto instance,
) => <String, dynamic>{
  'nameDe': instance.nameDe,
  'nameEn': instance.nameEn,
  'descriptionDe': instance.descriptionDe,
  'descriptionEn': instance.descriptionEn,
  'iconName': instance.iconName,
  'subcategories': instance.subcategories,
};
