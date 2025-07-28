import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_dto.freezed.dart';
part 'story_dto.g.dart';

@freezed
abstract class StoryDto with _$StoryDto {
  const factory StoryDto({
    required String titleGerman,
    required String contentGerman,
    required String titleEnglish,
    required String contentEnglish,
  }) = _StoryDto;

  factory StoryDto.fromJson(Map<String, dynamic> json) =>
      _$StoryDtoFromJson(json);
}
