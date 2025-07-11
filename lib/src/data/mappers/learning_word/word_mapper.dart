import 'package:the_kids_app/src/data/dtos/learning_word/word_dto.dart';
import 'package:the_kids_app/src/domain/entities/learning_word/word_entity.dart';

extension WordMapper on WordDto {
  WordEntity toEntity() => WordEntity(
    exampleSentenceDe: exampleSentenceDe,
    exampleSentenceEn: exampleSentenceEn,
    id: id,
    ipa: ipa,
    wordDe: wordDe,
    wordEn: wordEn,
    wordType: wordType,
    article: article,
    pluralDe: pluralDe,
    pluralEn: pluralEn,
  );
}

extension WordListMapper on List<WordDto> {
  List<WordEntity> toEntityList() {
    return map((dto) => dto.toEntity()).toList();
  }
}
