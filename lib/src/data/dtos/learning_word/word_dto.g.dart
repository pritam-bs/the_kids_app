// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WordDto _$WordDtoFromJson(Map<String, dynamic> json) => _WordDto(
  exampleSentenceDe: json['exampleSentenceDe'] as String,
  exampleSentenceEn: json['exampleSentenceEn'] as String,
  id: json['id'] as String,
  ipa: json['ipa'] as String,
  wordDe: json['wordDe'] as String,
  wordEn: json['wordEn'] as String,
  wordType: json['wordType'] as String,
  article: json['article'] as String?,
  pluralDe: json['pluralDe'] as String?,
  pluralEn: json['pluralEn'] as String?,
);

Map<String, dynamic> _$WordDtoToJson(_WordDto instance) => <String, dynamic>{
  'exampleSentenceDe': instance.exampleSentenceDe,
  'exampleSentenceEn': instance.exampleSentenceEn,
  'id': instance.id,
  'ipa': instance.ipa,
  'wordDe': instance.wordDe,
  'wordEn': instance.wordEn,
  'wordType': instance.wordType,
  'article': instance.article,
  'pluralDe': instance.pluralDe,
  'pluralEn': instance.pluralEn,
};
