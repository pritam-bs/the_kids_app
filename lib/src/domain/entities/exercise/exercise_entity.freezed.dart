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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MatchWordExerciseEntity value)?  matchWord,TResult Function( ListenChooseExerciseEntity value)?  listenChoose,TResult Function( SpellWordExerciseEntity value)?  spellWord,TResult Function( SentenceScrambleExerciseEntity value)?  sentenceScramble,TResult Function( BuildSentenceExerciseEntity value)?  buildSentence,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MatchWordExerciseEntity() when matchWord != null:
return matchWord(_that);case ListenChooseExerciseEntity() when listenChoose != null:
return listenChoose(_that);case SpellWordExerciseEntity() when spellWord != null:
return spellWord(_that);case SentenceScrambleExerciseEntity() when sentenceScramble != null:
return sentenceScramble(_that);case BuildSentenceExerciseEntity() when buildSentence != null:
return buildSentence(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MatchWordExerciseEntity value)  matchWord,required TResult Function( ListenChooseExerciseEntity value)  listenChoose,required TResult Function( SpellWordExerciseEntity value)  spellWord,required TResult Function( SentenceScrambleExerciseEntity value)  sentenceScramble,required TResult Function( BuildSentenceExerciseEntity value)  buildSentence,}){
final _that = this;
switch (_that) {
case MatchWordExerciseEntity():
return matchWord(_that);case ListenChooseExerciseEntity():
return listenChoose(_that);case SpellWordExerciseEntity():
return spellWord(_that);case SentenceScrambleExerciseEntity():
return sentenceScramble(_that);case BuildSentenceExerciseEntity():
return buildSentence(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MatchWordExerciseEntity value)?  matchWord,TResult? Function( ListenChooseExerciseEntity value)?  listenChoose,TResult? Function( SpellWordExerciseEntity value)?  spellWord,TResult? Function( SentenceScrambleExerciseEntity value)?  sentenceScramble,TResult? Function( BuildSentenceExerciseEntity value)?  buildSentence,}){
final _that = this;
switch (_that) {
case MatchWordExerciseEntity() when matchWord != null:
return matchWord(_that);case ListenChooseExerciseEntity() when listenChoose != null:
return listenChoose(_that);case SpellWordExerciseEntity() when spellWord != null:
return spellWord(_that);case SentenceScrambleExerciseEntity() when sentenceScramble != null:
return sentenceScramble(_that);case BuildSentenceExerciseEntity() when buildSentence != null:
return buildSentence(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String targetGermanWord,  List<String> englishOptions,  String correctEnglishWord)?  matchWord,TResult Function( WordEntity targetWord,  List<WordEntity> options)?  listenChoose,TResult Function( WordEntity wordToSpell)?  spellWord,TResult Function( String scrambledSentenceDe,  String correctSentenceEn)?  sentenceScramble,TResult Function( List<String> availableWords,  String targetSentenceEn)?  buildSentence,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MatchWordExerciseEntity() when matchWord != null:
return matchWord(_that.targetGermanWord,_that.englishOptions,_that.correctEnglishWord);case ListenChooseExerciseEntity() when listenChoose != null:
return listenChoose(_that.targetWord,_that.options);case SpellWordExerciseEntity() when spellWord != null:
return spellWord(_that.wordToSpell);case SentenceScrambleExerciseEntity() when sentenceScramble != null:
return sentenceScramble(_that.scrambledSentenceDe,_that.correctSentenceEn);case BuildSentenceExerciseEntity() when buildSentence != null:
return buildSentence(_that.availableWords,_that.targetSentenceEn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String targetGermanWord,  List<String> englishOptions,  String correctEnglishWord)  matchWord,required TResult Function( WordEntity targetWord,  List<WordEntity> options)  listenChoose,required TResult Function( WordEntity wordToSpell)  spellWord,required TResult Function( String scrambledSentenceDe,  String correctSentenceEn)  sentenceScramble,required TResult Function( List<String> availableWords,  String targetSentenceEn)  buildSentence,}) {final _that = this;
switch (_that) {
case MatchWordExerciseEntity():
return matchWord(_that.targetGermanWord,_that.englishOptions,_that.correctEnglishWord);case ListenChooseExerciseEntity():
return listenChoose(_that.targetWord,_that.options);case SpellWordExerciseEntity():
return spellWord(_that.wordToSpell);case SentenceScrambleExerciseEntity():
return sentenceScramble(_that.scrambledSentenceDe,_that.correctSentenceEn);case BuildSentenceExerciseEntity():
return buildSentence(_that.availableWords,_that.targetSentenceEn);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String targetGermanWord,  List<String> englishOptions,  String correctEnglishWord)?  matchWord,TResult? Function( WordEntity targetWord,  List<WordEntity> options)?  listenChoose,TResult? Function( WordEntity wordToSpell)?  spellWord,TResult? Function( String scrambledSentenceDe,  String correctSentenceEn)?  sentenceScramble,TResult? Function( List<String> availableWords,  String targetSentenceEn)?  buildSentence,}) {final _that = this;
switch (_that) {
case MatchWordExerciseEntity() when matchWord != null:
return matchWord(_that.targetGermanWord,_that.englishOptions,_that.correctEnglishWord);case ListenChooseExerciseEntity() when listenChoose != null:
return listenChoose(_that.targetWord,_that.options);case SpellWordExerciseEntity() when spellWord != null:
return spellWord(_that.wordToSpell);case SentenceScrambleExerciseEntity() when sentenceScramble != null:
return sentenceScramble(_that.scrambledSentenceDe,_that.correctSentenceEn);case BuildSentenceExerciseEntity() when buildSentence != null:
return buildSentence(_that.availableWords,_that.targetSentenceEn);case _:
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

// List of 3 English words (options)
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
  const ListenChooseExerciseEntity({required this.targetWord, required final  List<WordEntity> options}): _options = options;
  

 final  WordEntity targetWord;
 final  List<WordEntity> _options;
 List<WordEntity> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenChooseExerciseEntityCopyWith<ListenChooseExerciseEntity> get copyWith => _$ListenChooseExerciseEntityCopyWithImpl<ListenChooseExerciseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenChooseExerciseEntity&&(identical(other.targetWord, targetWord) || other.targetWord == targetWord)&&const DeepCollectionEquality().equals(other._options, _options));
}


@override
int get hashCode => Object.hash(runtimeType,targetWord,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'ExerciseEntity.listenChoose(targetWord: $targetWord, options: $options)';
}


}

/// @nodoc
abstract mixin class $ListenChooseExerciseEntityCopyWith<$Res> implements $ExerciseEntityCopyWith<$Res> {
  factory $ListenChooseExerciseEntityCopyWith(ListenChooseExerciseEntity value, $Res Function(ListenChooseExerciseEntity) _then) = _$ListenChooseExerciseEntityCopyWithImpl;
@useResult
$Res call({
 WordEntity targetWord, List<WordEntity> options
});


$WordEntityCopyWith<$Res> get targetWord;

}
/// @nodoc
class _$ListenChooseExerciseEntityCopyWithImpl<$Res>
    implements $ListenChooseExerciseEntityCopyWith<$Res> {
  _$ListenChooseExerciseEntityCopyWithImpl(this._self, this._then);

  final ListenChooseExerciseEntity _self;
  final $Res Function(ListenChooseExerciseEntity) _then;

/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetWord = null,Object? options = null,}) {
  return _then(ListenChooseExerciseEntity(
targetWord: null == targetWord ? _self.targetWord : targetWord // ignore: cast_nullable_to_non_nullable
as WordEntity,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<WordEntity>,
  ));
}

/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WordEntityCopyWith<$Res> get targetWord {
  
  return $WordEntityCopyWith<$Res>(_self.targetWord, (value) {
    return _then(_self.copyWith(targetWord: value));
  });
}
}

/// @nodoc


class SpellWordExerciseEntity implements ExerciseEntity {
  const SpellWordExerciseEntity({required this.wordToSpell});
  

 final  WordEntity wordToSpell;

/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpellWordExerciseEntityCopyWith<SpellWordExerciseEntity> get copyWith => _$SpellWordExerciseEntityCopyWithImpl<SpellWordExerciseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpellWordExerciseEntity&&(identical(other.wordToSpell, wordToSpell) || other.wordToSpell == wordToSpell));
}


@override
int get hashCode => Object.hash(runtimeType,wordToSpell);

@override
String toString() {
  return 'ExerciseEntity.spellWord(wordToSpell: $wordToSpell)';
}


}

/// @nodoc
abstract mixin class $SpellWordExerciseEntityCopyWith<$Res> implements $ExerciseEntityCopyWith<$Res> {
  factory $SpellWordExerciseEntityCopyWith(SpellWordExerciseEntity value, $Res Function(SpellWordExerciseEntity) _then) = _$SpellWordExerciseEntityCopyWithImpl;
@useResult
$Res call({
 WordEntity wordToSpell
});


$WordEntityCopyWith<$Res> get wordToSpell;

}
/// @nodoc
class _$SpellWordExerciseEntityCopyWithImpl<$Res>
    implements $SpellWordExerciseEntityCopyWith<$Res> {
  _$SpellWordExerciseEntityCopyWithImpl(this._self, this._then);

  final SpellWordExerciseEntity _self;
  final $Res Function(SpellWordExerciseEntity) _then;

/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? wordToSpell = null,}) {
  return _then(SpellWordExerciseEntity(
wordToSpell: null == wordToSpell ? _self.wordToSpell : wordToSpell // ignore: cast_nullable_to_non_nullable
as WordEntity,
  ));
}

/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WordEntityCopyWith<$Res> get wordToSpell {
  
  return $WordEntityCopyWith<$Res>(_self.wordToSpell, (value) {
    return _then(_self.copyWith(wordToSpell: value));
  });
}
}

/// @nodoc


class SentenceScrambleExerciseEntity implements ExerciseEntity {
  const SentenceScrambleExerciseEntity({required this.scrambledSentenceDe, required this.correctSentenceEn});
  

 final  String scrambledSentenceDe;
 final  String correctSentenceEn;

/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SentenceScrambleExerciseEntityCopyWith<SentenceScrambleExerciseEntity> get copyWith => _$SentenceScrambleExerciseEntityCopyWithImpl<SentenceScrambleExerciseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SentenceScrambleExerciseEntity&&(identical(other.scrambledSentenceDe, scrambledSentenceDe) || other.scrambledSentenceDe == scrambledSentenceDe)&&(identical(other.correctSentenceEn, correctSentenceEn) || other.correctSentenceEn == correctSentenceEn));
}


@override
int get hashCode => Object.hash(runtimeType,scrambledSentenceDe,correctSentenceEn);

@override
String toString() {
  return 'ExerciseEntity.sentenceScramble(scrambledSentenceDe: $scrambledSentenceDe, correctSentenceEn: $correctSentenceEn)';
}


}

/// @nodoc
abstract mixin class $SentenceScrambleExerciseEntityCopyWith<$Res> implements $ExerciseEntityCopyWith<$Res> {
  factory $SentenceScrambleExerciseEntityCopyWith(SentenceScrambleExerciseEntity value, $Res Function(SentenceScrambleExerciseEntity) _then) = _$SentenceScrambleExerciseEntityCopyWithImpl;
@useResult
$Res call({
 String scrambledSentenceDe, String correctSentenceEn
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
@pragma('vm:prefer-inline') $Res call({Object? scrambledSentenceDe = null,Object? correctSentenceEn = null,}) {
  return _then(SentenceScrambleExerciseEntity(
scrambledSentenceDe: null == scrambledSentenceDe ? _self.scrambledSentenceDe : scrambledSentenceDe // ignore: cast_nullable_to_non_nullable
as String,correctSentenceEn: null == correctSentenceEn ? _self.correctSentenceEn : correctSentenceEn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BuildSentenceExerciseEntity implements ExerciseEntity {
  const BuildSentenceExerciseEntity({required final  List<String> availableWords, required this.targetSentenceEn}): _availableWords = availableWords;
  

 final  List<String> _availableWords;
 List<String> get availableWords {
  if (_availableWords is EqualUnmodifiableListView) return _availableWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableWords);
}

 final  String targetSentenceEn;

/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildSentenceExerciseEntityCopyWith<BuildSentenceExerciseEntity> get copyWith => _$BuildSentenceExerciseEntityCopyWithImpl<BuildSentenceExerciseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildSentenceExerciseEntity&&const DeepCollectionEquality().equals(other._availableWords, _availableWords)&&(identical(other.targetSentenceEn, targetSentenceEn) || other.targetSentenceEn == targetSentenceEn));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_availableWords),targetSentenceEn);

@override
String toString() {
  return 'ExerciseEntity.buildSentence(availableWords: $availableWords, targetSentenceEn: $targetSentenceEn)';
}


}

/// @nodoc
abstract mixin class $BuildSentenceExerciseEntityCopyWith<$Res> implements $ExerciseEntityCopyWith<$Res> {
  factory $BuildSentenceExerciseEntityCopyWith(BuildSentenceExerciseEntity value, $Res Function(BuildSentenceExerciseEntity) _then) = _$BuildSentenceExerciseEntityCopyWithImpl;
@useResult
$Res call({
 List<String> availableWords, String targetSentenceEn
});




}
/// @nodoc
class _$BuildSentenceExerciseEntityCopyWithImpl<$Res>
    implements $BuildSentenceExerciseEntityCopyWith<$Res> {
  _$BuildSentenceExerciseEntityCopyWithImpl(this._self, this._then);

  final BuildSentenceExerciseEntity _self;
  final $Res Function(BuildSentenceExerciseEntity) _then;

/// Create a copy of ExerciseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? availableWords = null,Object? targetSentenceEn = null,}) {
  return _then(BuildSentenceExerciseEntity(
availableWords: null == availableWords ? _self._availableWords : availableWords // ignore: cast_nullable_to_non_nullable
as List<String>,targetSentenceEn: null == targetSentenceEn ? _self.targetSentenceEn : targetSentenceEn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
