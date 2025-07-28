import 'package:the_kids_app/src/domain/entities/story/story_entity.dart';

abstract class StoryRepository {
  Future<StoryEntity> getStory();
}
