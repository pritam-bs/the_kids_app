
import 'package:the_kids_app/src/data/dtos/story/story_dto.dart';

abstract class StoryDataSource {
  Future<StoryDto> fetchStory();
}
