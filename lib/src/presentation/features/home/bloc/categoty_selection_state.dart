import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_kids_app/src/domain/entities/learning_category/learning_category_entity.dart';

part 'categoty_selection_state.freezed.dart';

@freezed
sealed class CategorySelectionState with _$CategorySelectionState {
  const factory CategorySelectionState.initial() = Initial;
  const factory CategorySelectionState.initialError(String message) =
      InitialError;
  const factory CategorySelectionState.loaded({
    required List<LearningCategoryEntity> learningCategories,
  }) = Loaded;
}
