// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learned_word_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LearnedWordDto {

@Id() int get id;@Id() set id(int value); String get word; set word(String value); String get category; set category(String value); int get seenCount; set seenCount(int value); int get exerciseCount; set exerciseCount(int value); bool get isMatchWordGenerated; set isMatchWordGenerated(bool value); bool get isListenChooseGenerated; set isListenChooseGenerated(bool value); bool get isSpellWordGenerated; set isSpellWordGenerated(bool value); bool get isSentenceScrambleGenerated; set isSentenceScrambleGenerated(bool value);
/// Create a copy of LearnedWordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearnedWordDtoCopyWith<LearnedWordDto> get copyWith => _$LearnedWordDtoCopyWithImpl<LearnedWordDto>(this as LearnedWordDto, _$identity);

  /// Serializes this LearnedWordDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearnedWordDto&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.category, category) || other.category == category)&&(identical(other.seenCount, seenCount) || other.seenCount == seenCount)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount)&&(identical(other.isMatchWordGenerated, isMatchWordGenerated) || other.isMatchWordGenerated == isMatchWordGenerated)&&(identical(other.isListenChooseGenerated, isListenChooseGenerated) || other.isListenChooseGenerated == isListenChooseGenerated)&&(identical(other.isSpellWordGenerated, isSpellWordGenerated) || other.isSpellWordGenerated == isSpellWordGenerated)&&(identical(other.isSentenceScrambleGenerated, isSentenceScrambleGenerated) || other.isSentenceScrambleGenerated == isSentenceScrambleGenerated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,word,category,seenCount,exerciseCount,isMatchWordGenerated,isListenChooseGenerated,isSpellWordGenerated,isSentenceScrambleGenerated);

@override
String toString() {
  return 'LearnedWordDto(id: $id, word: $word, category: $category, seenCount: $seenCount, exerciseCount: $exerciseCount, isMatchWordGenerated: $isMatchWordGenerated, isListenChooseGenerated: $isListenChooseGenerated, isSpellWordGenerated: $isSpellWordGenerated, isSentenceScrambleGenerated: $isSentenceScrambleGenerated)';
}


}

/// @nodoc
abstract mixin class $LearnedWordDtoCopyWith<$Res>  {
  factory $LearnedWordDtoCopyWith(LearnedWordDto value, $Res Function(LearnedWordDto) _then) = _$LearnedWordDtoCopyWithImpl;
@useResult
$Res call({
@Id() int id, String word, String category, int seenCount, int exerciseCount, bool isMatchWordGenerated, bool isListenChooseGenerated, bool isSpellWordGenerated, bool isSentenceScrambleGenerated
});




}
/// @nodoc
class _$LearnedWordDtoCopyWithImpl<$Res>
    implements $LearnedWordDtoCopyWith<$Res> {
  _$LearnedWordDtoCopyWithImpl(this._self, this._then);

  final LearnedWordDto _self;
  final $Res Function(LearnedWordDto) _then;

/// Create a copy of LearnedWordDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? word = null,Object? category = null,Object? seenCount = null,Object? exerciseCount = null,Object? isMatchWordGenerated = null,Object? isListenChooseGenerated = null,Object? isSpellWordGenerated = null,Object? isSentenceScrambleGenerated = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,seenCount: null == seenCount ? _self.seenCount : seenCount // ignore: cast_nullable_to_non_nullable
as int,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,isMatchWordGenerated: null == isMatchWordGenerated ? _self.isMatchWordGenerated : isMatchWordGenerated // ignore: cast_nullable_to_non_nullable
as bool,isListenChooseGenerated: null == isListenChooseGenerated ? _self.isListenChooseGenerated : isListenChooseGenerated // ignore: cast_nullable_to_non_nullable
as bool,isSpellWordGenerated: null == isSpellWordGenerated ? _self.isSpellWordGenerated : isSpellWordGenerated // ignore: cast_nullable_to_non_nullable
as bool,isSentenceScrambleGenerated: null == isSentenceScrambleGenerated ? _self.isSentenceScrambleGenerated : isSentenceScrambleGenerated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LearnedWordDto].
extension LearnedWordDtoPatterns on LearnedWordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearnedWordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearnedWordDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearnedWordDto value)  $default,){
final _that = this;
switch (_that) {
case _LearnedWordDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearnedWordDto value)?  $default,){
final _that = this;
switch (_that) {
case _LearnedWordDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@Id()  int id,  String word,  String category,  int seenCount,  int exerciseCount,  bool isMatchWordGenerated,  bool isListenChooseGenerated,  bool isSpellWordGenerated,  bool isSentenceScrambleGenerated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearnedWordDto() when $default != null:
return $default(_that.id,_that.word,_that.category,_that.seenCount,_that.exerciseCount,_that.isMatchWordGenerated,_that.isListenChooseGenerated,_that.isSpellWordGenerated,_that.isSentenceScrambleGenerated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@Id()  int id,  String word,  String category,  int seenCount,  int exerciseCount,  bool isMatchWordGenerated,  bool isListenChooseGenerated,  bool isSpellWordGenerated,  bool isSentenceScrambleGenerated)  $default,) {final _that = this;
switch (_that) {
case _LearnedWordDto():
return $default(_that.id,_that.word,_that.category,_that.seenCount,_that.exerciseCount,_that.isMatchWordGenerated,_that.isListenChooseGenerated,_that.isSpellWordGenerated,_that.isSentenceScrambleGenerated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@Id()  int id,  String word,  String category,  int seenCount,  int exerciseCount,  bool isMatchWordGenerated,  bool isListenChooseGenerated,  bool isSpellWordGenerated,  bool isSentenceScrambleGenerated)?  $default,) {final _that = this;
switch (_that) {
case _LearnedWordDto() when $default != null:
return $default(_that.id,_that.word,_that.category,_that.seenCount,_that.exerciseCount,_that.isMatchWordGenerated,_that.isListenChooseGenerated,_that.isSpellWordGenerated,_that.isSentenceScrambleGenerated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@Entity(realClass: LearnedWordDto)
class _LearnedWordDto implements LearnedWordDto {
   _LearnedWordDto({@Id() this.id = 0, required this.word, required this.category, this.seenCount = 0, this.exerciseCount = 0, this.isMatchWordGenerated = false, this.isListenChooseGenerated = false, this.isSpellWordGenerated = false, this.isSentenceScrambleGenerated = false});
  factory _LearnedWordDto.fromJson(Map<String, dynamic> json) => _$LearnedWordDtoFromJson(json);

@override@JsonKey()@Id()  int id;
@override  String word;
@override  String category;
@override@JsonKey()  int seenCount;
@override@JsonKey()  int exerciseCount;
@override@JsonKey()  bool isMatchWordGenerated;
@override@JsonKey()  bool isListenChooseGenerated;
@override@JsonKey()  bool isSpellWordGenerated;
@override@JsonKey()  bool isSentenceScrambleGenerated;

/// Create a copy of LearnedWordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearnedWordDtoCopyWith<_LearnedWordDto> get copyWith => __$LearnedWordDtoCopyWithImpl<_LearnedWordDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LearnedWordDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearnedWordDto&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.category, category) || other.category == category)&&(identical(other.seenCount, seenCount) || other.seenCount == seenCount)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount)&&(identical(other.isMatchWordGenerated, isMatchWordGenerated) || other.isMatchWordGenerated == isMatchWordGenerated)&&(identical(other.isListenChooseGenerated, isListenChooseGenerated) || other.isListenChooseGenerated == isListenChooseGenerated)&&(identical(other.isSpellWordGenerated, isSpellWordGenerated) || other.isSpellWordGenerated == isSpellWordGenerated)&&(identical(other.isSentenceScrambleGenerated, isSentenceScrambleGenerated) || other.isSentenceScrambleGenerated == isSentenceScrambleGenerated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,word,category,seenCount,exerciseCount,isMatchWordGenerated,isListenChooseGenerated,isSpellWordGenerated,isSentenceScrambleGenerated);

@override
String toString() {
  return 'LearnedWordDto(id: $id, word: $word, category: $category, seenCount: $seenCount, exerciseCount: $exerciseCount, isMatchWordGenerated: $isMatchWordGenerated, isListenChooseGenerated: $isListenChooseGenerated, isSpellWordGenerated: $isSpellWordGenerated, isSentenceScrambleGenerated: $isSentenceScrambleGenerated)';
}


}

/// @nodoc
abstract mixin class _$LearnedWordDtoCopyWith<$Res> implements $LearnedWordDtoCopyWith<$Res> {
  factory _$LearnedWordDtoCopyWith(_LearnedWordDto value, $Res Function(_LearnedWordDto) _then) = __$LearnedWordDtoCopyWithImpl;
@override @useResult
$Res call({
@Id() int id, String word, String category, int seenCount, int exerciseCount, bool isMatchWordGenerated, bool isListenChooseGenerated, bool isSpellWordGenerated, bool isSentenceScrambleGenerated
});




}
/// @nodoc
class __$LearnedWordDtoCopyWithImpl<$Res>
    implements _$LearnedWordDtoCopyWith<$Res> {
  __$LearnedWordDtoCopyWithImpl(this._self, this._then);

  final _LearnedWordDto _self;
  final $Res Function(_LearnedWordDto) _then;

/// Create a copy of LearnedWordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? word = null,Object? category = null,Object? seenCount = null,Object? exerciseCount = null,Object? isMatchWordGenerated = null,Object? isListenChooseGenerated = null,Object? isSpellWordGenerated = null,Object? isSentenceScrambleGenerated = null,}) {
  return _then(_LearnedWordDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,seenCount: null == seenCount ? _self.seenCount : seenCount // ignore: cast_nullable_to_non_nullable
as int,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,isMatchWordGenerated: null == isMatchWordGenerated ? _self.isMatchWordGenerated : isMatchWordGenerated // ignore: cast_nullable_to_non_nullable
as bool,isListenChooseGenerated: null == isListenChooseGenerated ? _self.isListenChooseGenerated : isListenChooseGenerated // ignore: cast_nullable_to_non_nullable
as bool,isSpellWordGenerated: null == isSpellWordGenerated ? _self.isSpellWordGenerated : isSpellWordGenerated // ignore: cast_nullable_to_non_nullable
as bool,isSentenceScrambleGenerated: null == isSentenceScrambleGenerated ? _self.isSentenceScrambleGenerated : isSentenceScrambleGenerated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
