// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learned_word_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LearnedWordDto _$LearnedWordDtoFromJson(Map<String, dynamic> json) =>
    _LearnedWordDto(
      id: (json['id'] as num?)?.toInt() ?? 0,
      word: json['word'] as String,
      category: json['category'] as String,
      seenCount: (json['seenCount'] as num?)?.toInt() ?? 0,
      exerciseCount: (json['exerciseCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$LearnedWordDtoToJson(_LearnedWordDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'category': instance.category,
      'seenCount': instance.seenCount,
      'exerciseCount': instance.exerciseCount,
    };
