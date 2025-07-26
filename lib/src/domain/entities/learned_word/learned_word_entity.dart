import 'package:freezed_annotation/freezed_annotation.dart';

part 'learned_word_entity.freezed.dart';

@freezed
abstract class LearnedWordEntity with _$LearnedWordEntity {
  const factory LearnedWordEntity({
    int? id,
    required String word,
    required String category,
    @Default(0) int seenCount,
    @Default(0) int exerciseCount,
  }) = _LearnedWordEntity;
}
