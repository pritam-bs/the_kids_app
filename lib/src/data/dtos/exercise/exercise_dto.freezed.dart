// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ExerciseDto _$ExerciseDtoFromJson(
  Map<String, dynamic> json
) {
        switch (json['exerciseType']) {
                  case 'matchWord':
          return MatchWordExerciseDto.fromJson(
            json
          );
                case 'listenChoose':
          return ListenChooseExerciseDto.fromJson(
            json
          );
                case 'spellWord':
          return SpellWordExerciseDto.fromJson(
            json
          );
                case 'sentenceScramble':
          return SentenceScrambleExerciseDto.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'exerciseType',
  'ExerciseDto',
  'Invalid union type "${json['exerciseType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ExerciseDto {



  /// Serializes this ExerciseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseDto);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseDto()';
}


}

/// @nodoc
class $ExerciseDtoCopyWith<$Res>  {
$ExerciseDtoCopyWith(ExerciseDto _, $Res Function(ExerciseDto) __);
}


/// Adds pattern-matching-related methods to [ExerciseDto].
extension ExerciseDtoPatterns on ExerciseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MatchWordExerciseDto value)?  matchWord,TResult Function( ListenChooseExerciseDto value)?  listenChoose,TResult Function( SpellWordExerciseDto value)?  spellWord,TResult Function( SentenceScrambleExerciseDto value)?  sentenceScramble,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MatchWordExerciseDto() when matchWord != null:
return matchWord(_that);case ListenChooseExerciseDto() when listenChoose != null:
return listenChoose(_that);case SpellWordExerciseDto() when spellWord != null:
return spellWord(_that);case SentenceScrambleExerciseDto() when sentenceScramble != null:
return sentenceScramble(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MatchWordExerciseDto value)  matchWord,required TResult Function( ListenChooseExerciseDto value)  listenChoose,required TResult Function( SpellWordExerciseDto value)  spellWord,required TResult Function( SentenceScrambleExerciseDto value)  sentenceScramble,}){
final _that = this;
switch (_that) {
case MatchWordExerciseDto():
return matchWord(_that);case ListenChooseExerciseDto():
return listenChoose(_that);case SpellWordExerciseDto():
return spellWord(_that);case SentenceScrambleExerciseDto():
return sentenceScramble(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MatchWordExerciseDto value)?  matchWord,TResult? Function( ListenChooseExerciseDto value)?  listenChoose,TResult? Function( SpellWordExerciseDto value)?  spellWord,TResult? Function( SentenceScrambleExerciseDto value)?  sentenceScramble,}){
final _that = this;
switch (_that) {
case MatchWordExerciseDto() when matchWord != null:
return matchWord(_that);case ListenChooseExerciseDto() when listenChoose != null:
return listenChoose(_that);case SpellWordExerciseDto() when spellWord != null:
return spellWord(_that);case SentenceScrambleExerciseDto() when sentenceScramble != null:
return sentenceScramble(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String targetGermanWord,  List<String> englishOptions,  String correctEnglishWord)?  matchWord,TResult Function( String targetGermanWord,  List<String> germanOptions)?  listenChoose,TResult Function( String targetGermanWord,  List<String> scrambledLetters,  String englishTranslation)?  spellWord,TResult Function( String targetGermanSentence,  String englishTranslation,  List<String> scrambledWords)?  sentenceScramble,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MatchWordExerciseDto() when matchWord != null:
return matchWord(_that.targetGermanWord,_that.englishOptions,_that.correctEnglishWord);case ListenChooseExerciseDto() when listenChoose != null:
return listenChoose(_that.targetGermanWord,_that.germanOptions);case SpellWordExerciseDto() when spellWord != null:
return spellWord(_that.targetGermanWord,_that.scrambledLetters,_that.englishTranslation);case SentenceScrambleExerciseDto() when sentenceScramble != null:
return sentenceScramble(_that.targetGermanSentence,_that.englishTranslation,_that.scrambledWords);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String targetGermanWord,  List<String> englishOptions,  String correctEnglishWord)  matchWord,required TResult Function( String targetGermanWord,  List<String> germanOptions)  listenChoose,required TResult Function( String targetGermanWord,  List<String> scrambledLetters,  String englishTranslation)  spellWord,required TResult Function( String targetGermanSentence,  String englishTranslation,  List<String> scrambledWords)  sentenceScramble,}) {final _that = this;
switch (_that) {
case MatchWordExerciseDto():
return matchWord(_that.targetGermanWord,_that.englishOptions,_that.correctEnglishWord);case ListenChooseExerciseDto():
return listenChoose(_that.targetGermanWord,_that.germanOptions);case SpellWordExerciseDto():
return spellWord(_that.targetGermanWord,_that.scrambledLetters,_that.englishTranslation);case SentenceScrambleExerciseDto():
return sentenceScramble(_that.targetGermanSentence,_that.englishTranslation,_that.scrambledWords);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String targetGermanWord,  List<String> englishOptions,  String correctEnglishWord)?  matchWord,TResult? Function( String targetGermanWord,  List<String> germanOptions)?  listenChoose,TResult? Function( String targetGermanWord,  List<String> scrambledLetters,  String englishTranslation)?  spellWord,TResult? Function( String targetGermanSentence,  String englishTranslation,  List<String> scrambledWords)?  sentenceScramble,}) {final _that = this;
switch (_that) {
case MatchWordExerciseDto() when matchWord != null:
return matchWord(_that.targetGermanWord,_that.englishOptions,_that.correctEnglishWord);case ListenChooseExerciseDto() when listenChoose != null:
return listenChoose(_that.targetGermanWord,_that.germanOptions);case SpellWordExerciseDto() when spellWord != null:
return spellWord(_that.targetGermanWord,_that.scrambledLetters,_that.englishTranslation);case SentenceScrambleExerciseDto() when sentenceScramble != null:
return sentenceScramble(_that.targetGermanSentence,_that.englishTranslation,_that.scrambledWords);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class MatchWordExerciseDto extends ExerciseDto {
  const MatchWordExerciseDto({required this.targetGermanWord, required final  List<String> englishOptions, required this.correctEnglishWord, final  String? $type}): _englishOptions = englishOptions,$type = $type ?? 'matchWord',super._();
  factory MatchWordExerciseDto.fromJson(Map<String, dynamic> json) => _$MatchWordExerciseDtoFromJson(json);

 final  String targetGermanWord;
 final  List<String> _englishOptions;
 List<String> get englishOptions {
  if (_englishOptions is EqualUnmodifiableListView) return _englishOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_englishOptions);
}

 final  String correctEnglishWord;

@JsonKey(name: 'exerciseType')
final String $type;


/// Create a copy of ExerciseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchWordExerciseDtoCopyWith<MatchWordExerciseDto> get copyWith => _$MatchWordExerciseDtoCopyWithImpl<MatchWordExerciseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchWordExerciseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchWordExerciseDto&&(identical(other.targetGermanWord, targetGermanWord) || other.targetGermanWord == targetGermanWord)&&const DeepCollectionEquality().equals(other._englishOptions, _englishOptions)&&(identical(other.correctEnglishWord, correctEnglishWord) || other.correctEnglishWord == correctEnglishWord));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetGermanWord,const DeepCollectionEquality().hash(_englishOptions),correctEnglishWord);

@override
String toString() {
  return 'ExerciseDto.matchWord(targetGermanWord: $targetGermanWord, englishOptions: $englishOptions, correctEnglishWord: $correctEnglishWord)';
}


}

/// @nodoc
abstract mixin class $MatchWordExerciseDtoCopyWith<$Res> implements $ExerciseDtoCopyWith<$Res> {
  factory $MatchWordExerciseDtoCopyWith(MatchWordExerciseDto value, $Res Function(MatchWordExerciseDto) _then) = _$MatchWordExerciseDtoCopyWithImpl;
@useResult
$Res call({
 String targetGermanWord, List<String> englishOptions, String correctEnglishWord
});




}
/// @nodoc
class _$MatchWordExerciseDtoCopyWithImpl<$Res>
    implements $MatchWordExerciseDtoCopyWith<$Res> {
  _$MatchWordExerciseDtoCopyWithImpl(this._self, this._then);

  final MatchWordExerciseDto _self;
  final $Res Function(MatchWordExerciseDto) _then;

/// Create a copy of ExerciseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetGermanWord = null,Object? englishOptions = null,Object? correctEnglishWord = null,}) {
  return _then(MatchWordExerciseDto(
targetGermanWord: null == targetGermanWord ? _self.targetGermanWord : targetGermanWord // ignore: cast_nullable_to_non_nullable
as String,englishOptions: null == englishOptions ? _self._englishOptions : englishOptions // ignore: cast_nullable_to_non_nullable
as List<String>,correctEnglishWord: null == correctEnglishWord ? _self.correctEnglishWord : correctEnglishWord // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ListenChooseExerciseDto extends ExerciseDto {
  const ListenChooseExerciseDto({required this.targetGermanWord, required final  List<String> germanOptions, final  String? $type}): _germanOptions = germanOptions,$type = $type ?? 'listenChoose',super._();
  factory ListenChooseExerciseDto.fromJson(Map<String, dynamic> json) => _$ListenChooseExerciseDtoFromJson(json);

 final  String targetGermanWord;
 final  List<String> _germanOptions;
 List<String> get germanOptions {
  if (_germanOptions is EqualUnmodifiableListView) return _germanOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_germanOptions);
}


@JsonKey(name: 'exerciseType')
final String $type;


/// Create a copy of ExerciseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenChooseExerciseDtoCopyWith<ListenChooseExerciseDto> get copyWith => _$ListenChooseExerciseDtoCopyWithImpl<ListenChooseExerciseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenChooseExerciseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenChooseExerciseDto&&(identical(other.targetGermanWord, targetGermanWord) || other.targetGermanWord == targetGermanWord)&&const DeepCollectionEquality().equals(other._germanOptions, _germanOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetGermanWord,const DeepCollectionEquality().hash(_germanOptions));

@override
String toString() {
  return 'ExerciseDto.listenChoose(targetGermanWord: $targetGermanWord, germanOptions: $germanOptions)';
}


}

/// @nodoc
abstract mixin class $ListenChooseExerciseDtoCopyWith<$Res> implements $ExerciseDtoCopyWith<$Res> {
  factory $ListenChooseExerciseDtoCopyWith(ListenChooseExerciseDto value, $Res Function(ListenChooseExerciseDto) _then) = _$ListenChooseExerciseDtoCopyWithImpl;
@useResult
$Res call({
 String targetGermanWord, List<String> germanOptions
});




}
/// @nodoc
class _$ListenChooseExerciseDtoCopyWithImpl<$Res>
    implements $ListenChooseExerciseDtoCopyWith<$Res> {
  _$ListenChooseExerciseDtoCopyWithImpl(this._self, this._then);

  final ListenChooseExerciseDto _self;
  final $Res Function(ListenChooseExerciseDto) _then;

/// Create a copy of ExerciseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetGermanWord = null,Object? germanOptions = null,}) {
  return _then(ListenChooseExerciseDto(
targetGermanWord: null == targetGermanWord ? _self.targetGermanWord : targetGermanWord // ignore: cast_nullable_to_non_nullable
as String,germanOptions: null == germanOptions ? _self._germanOptions : germanOptions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SpellWordExerciseDto extends ExerciseDto {
  const SpellWordExerciseDto({required this.targetGermanWord, required final  List<String> scrambledLetters, required this.englishTranslation, final  String? $type}): _scrambledLetters = scrambledLetters,$type = $type ?? 'spellWord',super._();
  factory SpellWordExerciseDto.fromJson(Map<String, dynamic> json) => _$SpellWordExerciseDtoFromJson(json);

 final  String targetGermanWord;
 final  List<String> _scrambledLetters;
 List<String> get scrambledLetters {
  if (_scrambledLetters is EqualUnmodifiableListView) return _scrambledLetters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scrambledLetters);
}

 final  String englishTranslation;

@JsonKey(name: 'exerciseType')
final String $type;


/// Create a copy of ExerciseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpellWordExerciseDtoCopyWith<SpellWordExerciseDto> get copyWith => _$SpellWordExerciseDtoCopyWithImpl<SpellWordExerciseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpellWordExerciseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpellWordExerciseDto&&(identical(other.targetGermanWord, targetGermanWord) || other.targetGermanWord == targetGermanWord)&&const DeepCollectionEquality().equals(other._scrambledLetters, _scrambledLetters)&&(identical(other.englishTranslation, englishTranslation) || other.englishTranslation == englishTranslation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetGermanWord,const DeepCollectionEquality().hash(_scrambledLetters),englishTranslation);

@override
String toString() {
  return 'ExerciseDto.spellWord(targetGermanWord: $targetGermanWord, scrambledLetters: $scrambledLetters, englishTranslation: $englishTranslation)';
}


}

/// @nodoc
abstract mixin class $SpellWordExerciseDtoCopyWith<$Res> implements $ExerciseDtoCopyWith<$Res> {
  factory $SpellWordExerciseDtoCopyWith(SpellWordExerciseDto value, $Res Function(SpellWordExerciseDto) _then) = _$SpellWordExerciseDtoCopyWithImpl;
@useResult
$Res call({
 String targetGermanWord, List<String> scrambledLetters, String englishTranslation
});




}
/// @nodoc
class _$SpellWordExerciseDtoCopyWithImpl<$Res>
    implements $SpellWordExerciseDtoCopyWith<$Res> {
  _$SpellWordExerciseDtoCopyWithImpl(this._self, this._then);

  final SpellWordExerciseDto _self;
  final $Res Function(SpellWordExerciseDto) _then;

/// Create a copy of ExerciseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetGermanWord = null,Object? scrambledLetters = null,Object? englishTranslation = null,}) {
  return _then(SpellWordExerciseDto(
targetGermanWord: null == targetGermanWord ? _self.targetGermanWord : targetGermanWord // ignore: cast_nullable_to_non_nullable
as String,scrambledLetters: null == scrambledLetters ? _self._scrambledLetters : scrambledLetters // ignore: cast_nullable_to_non_nullable
as List<String>,englishTranslation: null == englishTranslation ? _self.englishTranslation : englishTranslation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SentenceScrambleExerciseDto extends ExerciseDto {
  const SentenceScrambleExerciseDto({required this.targetGermanSentence, required this.englishTranslation, required final  List<String> scrambledWords, final  String? $type}): _scrambledWords = scrambledWords,$type = $type ?? 'sentenceScramble',super._();
  factory SentenceScrambleExerciseDto.fromJson(Map<String, dynamic> json) => _$SentenceScrambleExerciseDtoFromJson(json);

 final  String targetGermanSentence;
 final  String englishTranslation;
 final  List<String> _scrambledWords;
 List<String> get scrambledWords {
  if (_scrambledWords is EqualUnmodifiableListView) return _scrambledWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scrambledWords);
}


@JsonKey(name: 'exerciseType')
final String $type;


/// Create a copy of ExerciseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SentenceScrambleExerciseDtoCopyWith<SentenceScrambleExerciseDto> get copyWith => _$SentenceScrambleExerciseDtoCopyWithImpl<SentenceScrambleExerciseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SentenceScrambleExerciseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SentenceScrambleExerciseDto&&(identical(other.targetGermanSentence, targetGermanSentence) || other.targetGermanSentence == targetGermanSentence)&&(identical(other.englishTranslation, englishTranslation) || other.englishTranslation == englishTranslation)&&const DeepCollectionEquality().equals(other._scrambledWords, _scrambledWords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetGermanSentence,englishTranslation,const DeepCollectionEquality().hash(_scrambledWords));

@override
String toString() {
  return 'ExerciseDto.sentenceScramble(targetGermanSentence: $targetGermanSentence, englishTranslation: $englishTranslation, scrambledWords: $scrambledWords)';
}


}

/// @nodoc
abstract mixin class $SentenceScrambleExerciseDtoCopyWith<$Res> implements $ExerciseDtoCopyWith<$Res> {
  factory $SentenceScrambleExerciseDtoCopyWith(SentenceScrambleExerciseDto value, $Res Function(SentenceScrambleExerciseDto) _then) = _$SentenceScrambleExerciseDtoCopyWithImpl;
@useResult
$Res call({
 String targetGermanSentence, String englishTranslation, List<String> scrambledWords
});




}
/// @nodoc
class _$SentenceScrambleExerciseDtoCopyWithImpl<$Res>
    implements $SentenceScrambleExerciseDtoCopyWith<$Res> {
  _$SentenceScrambleExerciseDtoCopyWithImpl(this._self, this._then);

  final SentenceScrambleExerciseDto _self;
  final $Res Function(SentenceScrambleExerciseDto) _then;

/// Create a copy of ExerciseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetGermanSentence = null,Object? englishTranslation = null,Object? scrambledWords = null,}) {
  return _then(SentenceScrambleExerciseDto(
targetGermanSentence: null == targetGermanSentence ? _self.targetGermanSentence : targetGermanSentence // ignore: cast_nullable_to_non_nullable
as String,englishTranslation: null == englishTranslation ? _self.englishTranslation : englishTranslation // ignore: cast_nullable_to_non_nullable
as String,scrambledWords: null == scrambledWords ? _self._scrambledWords : scrambledWords // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
