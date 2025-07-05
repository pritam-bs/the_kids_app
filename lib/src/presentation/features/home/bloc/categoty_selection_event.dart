import 'package:freezed_annotation/freezed_annotation.dart';

part 'categoty_selection_event.freezed.dart';

@freezed
sealed class CategorySelectionEvent with _$CategorySelectionEvent {
  const factory CategorySelectionEvent.initialize() = Initialize;
}
