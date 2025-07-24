// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchWordExerciseDto _$MatchWordExerciseDtoFromJson(
  Map<String, dynamic> json,
) => MatchWordExerciseDto(
  targetGermanWord: json['targetGermanWord'] as String,
  englishOptions: (json['englishOptions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  correctEnglishWord: json['correctEnglishWord'] as String,
  $type: json['exerciseType'] as String?,
);

Map<String, dynamic> _$MatchWordExerciseDtoToJson(
  MatchWordExerciseDto instance,
) => <String, dynamic>{
  'targetGermanWord': instance.targetGermanWord,
  'englishOptions': instance.englishOptions,
  'correctEnglishWord': instance.correctEnglishWord,
  'exerciseType': instance.$type,
};

ListenChooseExerciseDto _$ListenChooseExerciseDtoFromJson(
  Map<String, dynamic> json,
) => ListenChooseExerciseDto(
  targetGermanWord: json['targetGermanWord'] as String,
  germanOptions: (json['germanOptions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  $type: json['exerciseType'] as String?,
);

Map<String, dynamic> _$ListenChooseExerciseDtoToJson(
  ListenChooseExerciseDto instance,
) => <String, dynamic>{
  'targetGermanWord': instance.targetGermanWord,
  'germanOptions': instance.germanOptions,
  'exerciseType': instance.$type,
};

SpellWordExerciseDto _$SpellWordExerciseDtoFromJson(
  Map<String, dynamic> json,
) => SpellWordExerciseDto(
  targetGermanWord: json['targetGermanWord'] as String,
  scrambledLetters: (json['scrambledLetters'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  englishTranslation: json['englishTranslation'] as String,
  $type: json['exerciseType'] as String?,
);

Map<String, dynamic> _$SpellWordExerciseDtoToJson(
  SpellWordExerciseDto instance,
) => <String, dynamic>{
  'targetGermanWord': instance.targetGermanWord,
  'scrambledLetters': instance.scrambledLetters,
  'englishTranslation': instance.englishTranslation,
  'exerciseType': instance.$type,
};

SentenceScrambleExerciseDto _$SentenceScrambleExerciseDtoFromJson(
  Map<String, dynamic> json,
) => SentenceScrambleExerciseDto(
  targetGermanSentence: json['targetGermanSentence'] as String,
  englishTranslation: json['englishTranslation'] as String,
  scrambledWords: (json['scrambledWords'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  $type: json['exerciseType'] as String?,
);

Map<String, dynamic> _$SentenceScrambleExerciseDtoToJson(
  SentenceScrambleExerciseDto instance,
) => <String, dynamic>{
  'targetGermanSentence': instance.targetGermanSentence,
  'englishTranslation': instance.englishTranslation,
  'scrambledWords': instance.scrambledWords,
  'exerciseType': instance.$type,
};

BuildSentenceExerciseDto _$BuildSentenceExerciseDtoFromJson(
  Map<String, dynamic> json,
) => BuildSentenceExerciseDto(
  targetGermanSentence: json['targetGermanSentence'] as String,
  englishTranslation: json['englishTranslation'] as String,
  sentenceWithMissingWord: (json['sentenceWithMissingWord'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  optionsForMissingWord: (json['optionsForMissingWord'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  correctAnswerWord: json['correctAnswerWord'] as String,
  $type: json['exerciseType'] as String?,
);

Map<String, dynamic> _$BuildSentenceExerciseDtoToJson(
  BuildSentenceExerciseDto instance,
) => <String, dynamic>{
  'targetGermanSentence': instance.targetGermanSentence,
  'englishTranslation': instance.englishTranslation,
  'sentenceWithMissingWord': instance.sentenceWithMissingWord,
  'optionsForMissingWord': instance.optionsForMissingWord,
  'correctAnswerWord': instance.correctAnswerWord,
  'exerciseType': instance.$type,
};
