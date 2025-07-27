import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_kids_app/src/domain/entities/story/story_entity.dart';

part 'story_state.freezed.dart';

@freezed
sealed class StoryState with _$StoryState {
  const factory StoryState.initial() = Initial;
  const factory StoryState.loading() = Loading;
  const factory StoryState.loaded({required StoryEntity story}) = Loaded;
  const factory StoryState.error(String message) = Error;
}
