import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'learning_category_dto.freezed.dart';
part 'learning_category_dto.g.dart';

List<LearningCategoryDto> learningCategoryListDtoFromJson(String str) =>
    List<LearningCategoryDto>.from(
      json.decode(str).map((x) => LearningCategoryDto.fromJson(x)),
    );

String learningCategoryListDtoToJson(List<LearningCategoryDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class LearningCategoryDto with _$LearningCategoryDto {
  const factory LearningCategoryDto({
    required String id,
    required String nameDe,
    required String nameEn,
    required String descriptionDe,
    required String descriptionEn,
    required String iconName,
    List<LearningCategoryDto>? subcategories,
  }) = _LearningCategoryDto;

  factory LearningCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$LearningCategoryDtoFromJson(json);
}
