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
    @Default(false) bool isMatchWordGenerated,
    @Default(false) bool isListenChooseGenerated,
    @Default(false) bool isSpellWordGenerated,
    @Default(false) bool isSentenceScrambleGenerated,
  }) = _LearnedWordEntity;
}
