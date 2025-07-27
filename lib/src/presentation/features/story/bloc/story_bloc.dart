import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/domain/entities/story/story_entity.dart';
import 'package:the_kids_app/src/domain/usecases/story/story_usecase.dart';
import 'story_event.dart';
import 'story_state.dart';

@injectable
class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final StoryUsecase _storyUsecase;
  StoryEntity? _currentStory;

  StoryBloc(this._storyUsecase) : super(const StoryState.initial()) {
    on<StoryEvent>((event, emit) async {
      await event.map(loadStory: (e) => _onLoadStory(e, emit));
    });
  }

  Future<void> _onLoadStory(LoadStory event, Emitter<StoryState> emit) async {
    emit(const StoryState.loading());
    try {
      _currentStory = await _storyUsecase.loadStory();

      emit(StoryState.loaded(story: _currentStory!));
      AppLogger.d('Story loaded: ${_currentStory!.title}');
    } catch (e) {
      AppLogger.e('Error loading story: $e');
      emit(StoryState.error('Failed to load story: ${e.toString()}'));
    }
  }
}
