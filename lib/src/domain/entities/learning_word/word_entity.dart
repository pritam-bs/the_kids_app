import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_entity.freezed.dart';

@freezed
abstract class WordEntity with _$WordEntity {
  const factory WordEntity({
    required String exampleSentenceDe,
    required String exampleSentenceEn,
    required String id,
    required String ipa,
    required String wordDe,
    required String wordEn,
    required String wordType,
    String? article,
    String? pluralDe,
    String? pluralEn,
  }) = _WordEntity;
}
