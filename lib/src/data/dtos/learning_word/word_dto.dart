import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'word_dto.freezed.dart';
part 'word_dto.g.dart';

List<WordDto> wordListDtoFromJson(String str) =>
    List<WordDto>.from(json.decode(str).map((x) => WordDto.fromJson(x)));

String wordListDtoToJson(List<WordDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class WordDto with _$WordDto {
  const factory WordDto({
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
  }) = _WordDto;

  factory WordDto.fromJson(Map<String, dynamic> json) =>
      _$WordDtoFromJson(json);
}
