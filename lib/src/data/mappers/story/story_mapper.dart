import 'package:the_kids_app/src/data/dtos/story/story_dto.dart';
import 'package:the_kids_app/src/domain/entities/story/story_entity.dart';

extension StoryDtoMapper on StoryDto {
  StoryEntity toEntity() {
    return StoryEntity(
      title: titleGerman,
      content: contentGerman,
      titleEnglish: titleEnglish,
      contentEnglish: contentEnglish,
    );
  }
}
