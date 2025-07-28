import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/entities/story/story_entity.dart';
import 'package:the_kids_app/src/domain/repositories/story/story_repository.dart';

@injectable
class StoryUsecase {
  final StoryRepository _storyRepository;

  StoryUsecase(this._storyRepository);

  Future<StoryEntity> loadStory() {
    return _storyRepository.getStory();
  }
}
