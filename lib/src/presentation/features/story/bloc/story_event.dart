import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_event.freezed.dart';

@freezed
sealed class StoryEvent with _$StoryEvent {
  const factory StoryEvent.loadStory() = LoadStory;
}
