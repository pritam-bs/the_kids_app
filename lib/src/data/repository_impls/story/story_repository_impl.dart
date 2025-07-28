import 'package:the_kids_app/src/data/datasources/story/story_data_source.dart';
import 'package:the_kids_app/src/data/dtos/story/story_dto.dart';
import 'package:the_kids_app/src/data/mappers/story/story_mapper.dart';
import 'package:the_kids_app/src/domain/entities/story/story_entity.dart';
import 'package:the_kids_app/src/domain/repositories/story/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StoryDataSource _dataSource;

  StoryRepositoryImpl(this._dataSource);

  @override
  Future<StoryEntity> getStory() async {
    // Fetch the DTO from the data source
    final StoryDto storyDto = await _dataSource.fetchStory();

    // Map the DTO to the domain entity and return it
    return storyDto.toEntity();
  }
}
