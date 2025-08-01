// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExerciseEntity {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseEntity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseEntity()';
}


}

/// @nodoc
class $ExerciseEntityCopyWith<$Res>  {
$ExerciseEntityCopyWith(ExerciseEntity _, $Res Function(ExerciseEntity) __);
}


/// Adds pattern-matching-related methods to [ExerciseEntity].
extension ExerciseEntityPatterns on ExerciseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MatchWordExerciseEntity value)?  matchWord,TResult Function( ListenChooseExerciseEntity value)?  listenChoose,TResult Function( SpellWordExerciseEntity value)?  spellWord,TResult Function( SentenceScrambleExerciseEntity value)?  sentenceScramble,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MatchWordExerciseEntity() when matchWord != null:
return matchWord(_that);case ListenChooseExerciseEntity() when listenChoose != null:
return listenChoose(_that);case SpellWordExerciseEntity() when spellWord != null:
return spellWord(_that);case SentenceScrambleExerciseEntity() when sentenceScramble != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MatchWordExerciseEntity value)  matchWord,required TResult Function( ListenChooseExerciseEntity value)  listenChoose,required TResult Function( SpellWordExerciseEntity value)  spellWord,required TResult Function( SentenceScrambleExerciseEntity value)  sentenceScramble,}){
final _that = this;
switch (_that) {
case MatchWordExerciseEntity():
return matchWord(_that);case ListenChooseExerciseEntity():
return listenChoose(_that);case SpellWordExerciseEntity():
return spellWord(_that);case SentenceScrambleExerciseEntity():
return sentenceScramble(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MatchWordExerciseEntity value)?  matchWord,TResult? Function( ListenChooseExerciseEntity value)?  listenChoose,TResult? Function( SpellWordExerciseEntity value)?  spellWord,TResult? Function( SentenceScrambleExerciseEntity value)?  sentenceScramble,}){
final _that = this;
switch (_that) {
case MatchWordExerciseEntity() when matchWord != null:
return matchWord(_that);case ListenChooseExerciseEntity() when listenChoose != null:
return listenChoose(_that);case SpellWordExerciseEntity() when spellWord != null:
return spellWord(_that);case SentenceScrambleExerciseEntity() when sentenceScramble != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String targetGermanWord,  List<String> englishOptions,  String correctEnglishWord)?  matchWord,TResult Function( String targetGermanWord,  List<String> germanOptions)?  listenChoose,TResult Function( String targetGermanWord,  String englishTranslation,  List<String> scrambledLetters)?  spellWord,TResult Function( String targetGermanSentence,  String englishTranslation,  List<String> scrambledWords)?  sentenceScramble,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MatchWordExerciseEntity() when matchWord != null:
return matchWord(_that.targetGermanWord,_that.englishOptions,_that.correctEnglishWord);case ListenChooseExerciseEntity() when listenChoose != null:
return listenChoose(_that.targetGermanWord,_that.germanOptions);case SpellWordExerciseEntity() when spellWord != null:
return spellWord(_that.targetGermanWord,_that.englishTranslation,_that.scrambledLetters);case SentenceScrambleExerciseEntity() when sentenceScramble != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String targetGermanWord,  List<String> englishOptions,  String correctEnglishWord)  matchWord,required TResult Function( String targetGermanWord,  List<String> germanOptions)  listenChoose,required TResult Function( String targetGermanWord,  String englishTranslation,  List<String> scrambledLetters)  spellWord,required TResult Function( String targetGermanSentence,  String englishTranslation,  List<String> scrambledWords)  sentenceScramble,}) {final _that = this;
switch (_that) {
case MatchWordExerciseEntity():
return matchWord(_that.targetGermanWord,_that.englishOptions,_that.correctEnglishWord);case ListenChooseExerciseEntity():
return listenChoose(_that.targetGermanWord,_that.germanOptions);case SpellWordExerciseEntity():
return spellWord(_that.targetGermanWord,_that.englishTranslation,_that.scrambledLetters);case SentenceScrambleExerciseEntity():
return sentenceScramble(_that.targetGermanSentence,_that.englishTranslation,_that.scrambledWords);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String targetGermanWord,  List<String> englishOptions,  String correctEnglishWord)?  matchWord,TResult? Function( String targetGermanWord,  List<String> germanOptions)?  listenChoose,TResult? Function( String targetGermanWord,  String englishTranslation,  List<String> scrambledLetters)?  spellWord,TResult? Function( String targetGermanSentence,  String englishTranslation,  List<String> scrambledWords)?  sentenceScramble,}) {final _that = this;
switch (_that) {
case MatchWordExerciseEntity() when matchWord != null:
return matchWord(_that.targetGermanWord,_that.englishOptions,_that.correctEnglishWord);case ListenChooseExerciseEntity() when listenChoose != null:
return listenChoose(_that.targetGermanWord,_that.germanOptions);case SpellWordExerciseEntity() when spellWord != null:
return spellWord(_that.targetGermanWord,_that.englishTranslation,_that.scrambledLetters);case SentenceScrambleExerciseEntity() when sentenceScramble != null:
return sentenceScramble(_that.targetGermanSentence,_that.englishTranslation,_that.scrambledWords);case _:
  return null;

}
}

}

/// @nodoc


class MatchWordExerciseEntity implements ExerciseEntity {
  const MatchWordExerciseEntity({required this.targetGermanWord, required final  List<String> englishOptions, required this.correctEnglishWord}): _englishOptions = englishOptions;
  

 final  String targetGermanWord;
// The German word to be shown
 final  List<String> _englishOptions;
// The German word to be shown
 List<String> get englishOptions {
  if (_englishOptions is EqualUnmodifiableListView) return _englishOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_englishOptions);
}

// List of 3-4 English words
 final  String correctEnglishWord;

/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchWordExerciseEntityCopyWith<MatchWordExerciseEntity> get copyWith => _$MatchWordExerciseEntityCopyWithImpl<MatchWordExerciseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchWordExerciseEntity&&(identical(other.targetGermanWord, targetGermanWord) || other.targetGermanWord == targetGermanWord)&&const DeepCollectionEquality().equals(other._englishOptions, _englishOptions)&&(identical(other.correctEnglishWord, correctEnglishWord) || other.correctEnglishWord == correctEnglishWord));
}


@override
int get hashCode => Object.hash(runtimeType,targetGermanWord,const DeepCollectionEquality().hash(_englishOptions),correctEnglishWord);

@override
String toString() {
  return 'ExerciseEntity.matchWord(targetGermanWord: $targetGermanWord, englishOptions: $englishOptions, correctEnglishWord: $correctEnglishWord)';
}


}

/// @nodoc
abstract mixin class $MatchWordExerciseEntityCopyWith<$Res> implements $ExerciseEntityCopyWith<$Res> {
  factory $MatchWordExerciseEntityCopyWith(MatchWordExerciseEntity value, $Res Function(MatchWordExerciseEntity) _then) = _$MatchWordExerciseEntityCopyWithImpl;
@useResult
$Res call({
 String targetGermanWord, List<String> englishOptions, String correctEnglishWord
});




}
/// @nodoc
class _$MatchWordExerciseEntityCopyWithImpl<$Res>
    implements $MatchWordExerciseEntityCopyWith<$Res> {
  _$MatchWordExerciseEntityCopyWithImpl(this._self, this._then);

  final MatchWordExerciseEntity _self;
  final $Res Function(MatchWordExerciseEntity) _then;

/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetGermanWord = null,Object? englishOptions = null,Object? correctEnglishWord = null,}) {
  return _then(MatchWordExerciseEntity(
targetGermanWord: null == targetGermanWord ? _self.targetGermanWord : targetGermanWord // ignore: cast_nullable_to_non_nullable
as String,englishOptions: null == englishOptions ? _self._englishOptions : englishOptions // ignore: cast_nullable_to_non_nullable
as List<String>,correctEnglishWord: null == correctEnglishWord ? _self.correctEnglishWord : correctEnglishWord // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ListenChooseExerciseEntity implements ExerciseEntity {
  const ListenChooseExerciseEntity({required this.targetGermanWord, required final  List<String> germanOptions}): _germanOptions = germanOptions;
  

 final  String targetGermanWord;
// The German word to be spoken
 final  List<String> _germanOptions;
// The German word to be spoken
 List<String> get germanOptions {
  if (_germanOptions is EqualUnmodifiableListView) return _germanOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_germanOptions);
}


/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenChooseExerciseEntityCopyWith<ListenChooseExerciseEntity> get copyWith => _$ListenChooseExerciseEntityCopyWithImpl<ListenChooseExerciseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenChooseExerciseEntity&&(identical(other.targetGermanWord, targetGermanWord) || other.targetGermanWord == targetGermanWord)&&const DeepCollectionEquality().equals(other._germanOptions, _germanOptions));
}


@override
int get hashCode => Object.hash(runtimeType,targetGermanWord,const DeepCollectionEquality().hash(_germanOptions));

@override
String toString() {
  return 'ExerciseEntity.listenChoose(targetGermanWord: $targetGermanWord, germanOptions: $germanOptions)';
}


}

/// @nodoc
abstract mixin class $ListenChooseExerciseEntityCopyWith<$Res> implements $ExerciseEntityCopyWith<$Res> {
  factory $ListenChooseExerciseEntityCopyWith(ListenChooseExerciseEntity value, $Res Function(ListenChooseExerciseEntity) _then) = _$ListenChooseExerciseEntityCopyWithImpl;
@useResult
$Res call({
 String targetGermanWord, List<String> germanOptions
});




}
/// @nodoc
class _$ListenChooseExerciseEntityCopyWithImpl<$Res>
    implements $ListenChooseExerciseEntityCopyWith<$Res> {
  _$ListenChooseExerciseEntityCopyWithImpl(this._self, this._then);

  final ListenChooseExerciseEntity _self;
  final $Res Function(ListenChooseExerciseEntity) _then;

/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetGermanWord = null,Object? germanOptions = null,}) {
  return _then(ListenChooseExerciseEntity(
targetGermanWord: null == targetGermanWord ? _self.targetGermanWord : targetGermanWord // ignore: cast_nullable_to_non_nullable
as String,germanOptions: null == germanOptions ? _self._germanOptions : germanOptions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class SpellWordExerciseEntity implements ExerciseEntity {
  const SpellWordExerciseEntity({required this.targetGermanWord, required this.englishTranslation, required final  List<String> scrambledLetters}): _scrambledLetters = scrambledLetters;
  

 final  String targetGermanWord;
 final  String englishTranslation;
// The German word to be spelled
 final  List<String> _scrambledLetters;
// The German word to be spelled
 List<String> get scrambledLetters {
  if (_scrambledLetters is EqualUnmodifiableListView) return _scrambledLetters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scrambledLetters);
}


/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpellWordExerciseEntityCopyWith<SpellWordExerciseEntity> get copyWith => _$SpellWordExerciseEntityCopyWithImpl<SpellWordExerciseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpellWordExerciseEntity&&(identical(other.targetGermanWord, targetGermanWord) || other.targetGermanWord == targetGermanWord)&&(identical(other.englishTranslation, englishTranslation) || other.englishTranslation == englishTranslation)&&const DeepCollectionEquality().equals(other._scrambledLetters, _scrambledLetters));
}


@override
int get hashCode => Object.hash(runtimeType,targetGermanWord,englishTranslation,const DeepCollectionEquality().hash(_scrambledLetters));

@override
String toString() {
  return 'ExerciseEntity.spellWord(targetGermanWord: $targetGermanWord, englishTranslation: $englishTranslation, scrambledLetters: $scrambledLetters)';
}


}

/// @nodoc
abstract mixin class $SpellWordExerciseEntityCopyWith<$Res> implements $ExerciseEntityCopyWith<$Res> {
  factory $SpellWordExerciseEntityCopyWith(SpellWordExerciseEntity value, $Res Function(SpellWordExerciseEntity) _then) = _$SpellWordExerciseEntityCopyWithImpl;
@useResult
$Res call({
 String targetGermanWord, String englishTranslation, List<String> scrambledLetters
});




}
/// @nodoc
class _$SpellWordExerciseEntityCopyWithImpl<$Res>
    implements $SpellWordExerciseEntityCopyWith<$Res> {
  _$SpellWordExerciseEntityCopyWithImpl(this._self, this._then);

  final SpellWordExerciseEntity _self;
  final $Res Function(SpellWordExerciseEntity) _then;

/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetGermanWord = null,Object? englishTranslation = null,Object? scrambledLetters = null,}) {
  return _then(SpellWordExerciseEntity(
targetGermanWord: null == targetGermanWord ? _self.targetGermanWord : targetGermanWord // ignore: cast_nullable_to_non_nullable
as String,englishTranslation: null == englishTranslation ? _self.englishTranslation : englishTranslation // ignore: cast_nullable_to_non_nullable
as String,scrambledLetters: null == scrambledLetters ? _self._scrambledLetters : scrambledLetters // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class SentenceScrambleExerciseEntity implements ExerciseEntity {
  const SentenceScrambleExerciseEntity({required this.targetGermanSentence, required this.englishTranslation, required final  List<String> scrambledWords}): _scrambledWords = scrambledWords;
  

 final  String targetGermanSentence;
// The correct German sentence
 final  String englishTranslation;
// English translation of the sentence
 final  List<String> _scrambledWords;
// English translation of the sentence
 List<String> get scrambledWords {
  if (_scrambledWords is EqualUnmodifiableListView) return _scrambledWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scrambledWords);
}


/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SentenceScrambleExerciseEntityCopyWith<SentenceScrambleExerciseEntity> get copyWith => _$SentenceScrambleExerciseEntityCopyWithImpl<SentenceScrambleExerciseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SentenceScrambleExerciseEntity&&(identical(other.targetGermanSentence, targetGermanSentence) || other.targetGermanSentence == targetGermanSentence)&&(identical(other.englishTranslation, englishTranslation) || other.englishTranslation == englishTranslation)&&const DeepCollectionEquality().equals(other._scrambledWords, _scrambledWords));
}


@override
int get hashCode => Object.hash(runtimeType,targetGermanSentence,englishTranslation,const DeepCollectionEquality().hash(_scrambledWords));

@override
String toString() {
  return 'ExerciseEntity.sentenceScramble(targetGermanSentence: $targetGermanSentence, englishTranslation: $englishTranslation, scrambledWords: $scrambledWords)';
}


}

/// @nodoc
abstract mixin class $SentenceScrambleExerciseEntityCopyWith<$Res> implements $ExerciseEntityCopyWith<$Res> {
  factory $SentenceScrambleExerciseEntityCopyWith(SentenceScrambleExerciseEntity value, $Res Function(SentenceScrambleExerciseEntity) _then) = _$SentenceScrambleExerciseEntityCopyWithImpl;
@useResult
$Res call({
 String targetGermanSentence, String englishTranslation, List<String> scrambledWords
});




}
/// @nodoc
class _$SentenceScrambleExerciseEntityCopyWithImpl<$Res>
    implements $SentenceScrambleExerciseEntityCopyWith<$Res> {
  _$SentenceScrambleExerciseEntityCopyWithImpl(this._self, this._then);

  final SentenceScrambleExerciseEntity _self;
  final $Res Function(SentenceScrambleExerciseEntity) _then;

/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetGermanSentence = null,Object? englishTranslation = null,Object? scrambledWords = null,}) {
  return _then(SentenceScrambleExerciseEntity(
targetGermanSentence: null == targetGermanSentence ? _self.targetGermanSentence : targetGermanSentence // ignore: cast_nullable_to_non_nullable
as String,englishTranslation: null == englishTranslation ? _self.englishTranslation : englishTranslation // ignore: cast_nullable_to_non_nullable
as String,scrambledWords: null == scrambledWords ? _self._scrambledWords : scrambledWords // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
