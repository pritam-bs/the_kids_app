// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WordDto {

 String get exampleSentenceDe; String get exampleSentenceEn; String get id; String get ipa; String get wordDe; String get wordEn; String get wordType; String? get article; String? get pluralDe; String? get pluralEn;
/// Create a copy of WordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordDtoCopyWith<WordDto> get copyWith => _$WordDtoCopyWithImpl<WordDto>(this as WordDto, _$identity);

  /// Serializes this WordDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordDto&&(identical(other.exampleSentenceDe, exampleSentenceDe) || other.exampleSentenceDe == exampleSentenceDe)&&(identical(other.exampleSentenceEn, exampleSentenceEn) || other.exampleSentenceEn == exampleSentenceEn)&&(identical(other.id, id) || other.id == id)&&(identical(other.ipa, ipa) || other.ipa == ipa)&&(identical(other.wordDe, wordDe) || other.wordDe == wordDe)&&(identical(other.wordEn, wordEn) || other.wordEn == wordEn)&&(identical(other.wordType, wordType) || other.wordType == wordType)&&(identical(other.article, article) || other.article == article)&&(identical(other.pluralDe, pluralDe) || other.pluralDe == pluralDe)&&(identical(other.pluralEn, pluralEn) || other.pluralEn == pluralEn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exampleSentenceDe,exampleSentenceEn,id,ipa,wordDe,wordEn,wordType,article,pluralDe,pluralEn);

@override
String toString() {
  return 'WordDto(exampleSentenceDe: $exampleSentenceDe, exampleSentenceEn: $exampleSentenceEn, id: $id, ipa: $ipa, wordDe: $wordDe, wordEn: $wordEn, wordType: $wordType, article: $article, pluralDe: $pluralDe, pluralEn: $pluralEn)';
}


}

/// @nodoc
abstract mixin class $WordDtoCopyWith<$Res>  {
  factory $WordDtoCopyWith(WordDto value, $Res Function(WordDto) _then) = _$WordDtoCopyWithImpl;
@useResult
$Res call({
 String exampleSentenceDe, String exampleSentenceEn, String id, String ipa, String wordDe, String wordEn, String wordType, String? article, String? pluralDe, String? pluralEn
});




}
/// @nodoc
class _$WordDtoCopyWithImpl<$Res>
    implements $WordDtoCopyWith<$Res> {
  _$WordDtoCopyWithImpl(this._self, this._then);

  final WordDto _self;
  final $Res Function(WordDto) _then;

/// Create a copy of WordDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exampleSentenceDe = null,Object? exampleSentenceEn = null,Object? id = null,Object? ipa = null,Object? wordDe = null,Object? wordEn = null,Object? wordType = null,Object? article = freezed,Object? pluralDe = freezed,Object? pluralEn = freezed,}) {
  return _then(_self.copyWith(
exampleSentenceDe: null == exampleSentenceDe ? _self.exampleSentenceDe : exampleSentenceDe // ignore: cast_nullable_to_non_nullable
as String,exampleSentenceEn: null == exampleSentenceEn ? _self.exampleSentenceEn : exampleSentenceEn // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ipa: null == ipa ? _self.ipa : ipa // ignore: cast_nullable_to_non_nullable
as String,wordDe: null == wordDe ? _self.wordDe : wordDe // ignore: cast_nullable_to_non_nullable
as String,wordEn: null == wordEn ? _self.wordEn : wordEn // ignore: cast_nullable_to_non_nullable
as String,wordType: null == wordType ? _self.wordType : wordType // ignore: cast_nullable_to_non_nullable
as String,article: freezed == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as String?,pluralDe: freezed == pluralDe ? _self.pluralDe : pluralDe // ignore: cast_nullable_to_non_nullable
as String?,pluralEn: freezed == pluralEn ? _self.pluralEn : pluralEn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WordDto].
extension WordDtoPatterns on WordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordDto value)  $default,){
final _that = this;
switch (_that) {
case _WordDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordDto value)?  $default,){
final _that = this;
switch (_that) {
case _WordDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String exampleSentenceDe,  String exampleSentenceEn,  String id,  String ipa,  String wordDe,  String wordEn,  String wordType,  String? article,  String? pluralDe,  String? pluralEn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordDto() when $default != null:
return $default(_that.exampleSentenceDe,_that.exampleSentenceEn,_that.id,_that.ipa,_that.wordDe,_that.wordEn,_that.wordType,_that.article,_that.pluralDe,_that.pluralEn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String exampleSentenceDe,  String exampleSentenceEn,  String id,  String ipa,  String wordDe,  String wordEn,  String wordType,  String? article,  String? pluralDe,  String? pluralEn)  $default,) {final _that = this;
switch (_that) {
case _WordDto():
return $default(_that.exampleSentenceDe,_that.exampleSentenceEn,_that.id,_that.ipa,_that.wordDe,_that.wordEn,_that.wordType,_that.article,_that.pluralDe,_that.pluralEn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String exampleSentenceDe,  String exampleSentenceEn,  String id,  String ipa,  String wordDe,  String wordEn,  String wordType,  String? article,  String? pluralDe,  String? pluralEn)?  $default,) {final _that = this;
switch (_that) {
case _WordDto() when $default != null:
return $default(_that.exampleSentenceDe,_that.exampleSentenceEn,_that.id,_that.ipa,_that.wordDe,_that.wordEn,_that.wordType,_that.article,_that.pluralDe,_that.pluralEn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WordDto implements WordDto {
  const _WordDto({required this.exampleSentenceDe, required this.exampleSentenceEn, required this.id, required this.ipa, required this.wordDe, required this.wordEn, required this.wordType, this.article, this.pluralDe, this.pluralEn});
  factory _WordDto.fromJson(Map<String, dynamic> json) => _$WordDtoFromJson(json);

@override final  String exampleSentenceDe;
@override final  String exampleSentenceEn;
@override final  String id;
@override final  String ipa;
@override final  String wordDe;
@override final  String wordEn;
@override final  String wordType;
@override final  String? article;
@override final  String? pluralDe;
@override final  String? pluralEn;

/// Create a copy of WordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordDtoCopyWith<_WordDto> get copyWith => __$WordDtoCopyWithImpl<_WordDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WordDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordDto&&(identical(other.exampleSentenceDe, exampleSentenceDe) || other.exampleSentenceDe == exampleSentenceDe)&&(identical(other.exampleSentenceEn, exampleSentenceEn) || other.exampleSentenceEn == exampleSentenceEn)&&(identical(other.id, id) || other.id == id)&&(identical(other.ipa, ipa) || other.ipa == ipa)&&(identical(other.wordDe, wordDe) || other.wordDe == wordDe)&&(identical(other.wordEn, wordEn) || other.wordEn == wordEn)&&(identical(other.wordType, wordType) || other.wordType == wordType)&&(identical(other.article, article) || other.article == article)&&(identical(other.pluralDe, pluralDe) || other.pluralDe == pluralDe)&&(identical(other.pluralEn, pluralEn) || other.pluralEn == pluralEn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exampleSentenceDe,exampleSentenceEn,id,ipa,wordDe,wordEn,wordType,article,pluralDe,pluralEn);

@override
String toString() {
  return 'WordDto(exampleSentenceDe: $exampleSentenceDe, exampleSentenceEn: $exampleSentenceEn, id: $id, ipa: $ipa, wordDe: $wordDe, wordEn: $wordEn, wordType: $wordType, article: $article, pluralDe: $pluralDe, pluralEn: $pluralEn)';
}


}

/// @nodoc
abstract mixin class _$WordDtoCopyWith<$Res> implements $WordDtoCopyWith<$Res> {
  factory _$WordDtoCopyWith(_WordDto value, $Res Function(_WordDto) _then) = __$WordDtoCopyWithImpl;
@override @useResult
$Res call({
 String exampleSentenceDe, String exampleSentenceEn, String id, String ipa, String wordDe, String wordEn, String wordType, String? article, String? pluralDe, String? pluralEn
});




}
/// @nodoc
class __$WordDtoCopyWithImpl<$Res>
    implements _$WordDtoCopyWith<$Res> {
  __$WordDtoCopyWithImpl(this._self, this._then);

  final _WordDto _self;
  final $Res Function(_WordDto) _then;

/// Create a copy of WordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exampleSentenceDe = null,Object? exampleSentenceEn = null,Object? id = null,Object? ipa = null,Object? wordDe = null,Object? wordEn = null,Object? wordType = null,Object? article = freezed,Object? pluralDe = freezed,Object? pluralEn = freezed,}) {
  return _then(_WordDto(
exampleSentenceDe: null == exampleSentenceDe ? _self.exampleSentenceDe : exampleSentenceDe // ignore: cast_nullable_to_non_nullable
as String,exampleSentenceEn: null == exampleSentenceEn ? _self.exampleSentenceEn : exampleSentenceEn // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ipa: null == ipa ? _self.ipa : ipa // ignore: cast_nullable_to_non_nullable
as String,wordDe: null == wordDe ? _self.wordDe : wordDe // ignore: cast_nullable_to_non_nullable
as String,wordEn: null == wordEn ? _self.wordEn : wordEn // ignore: cast_nullable_to_non_nullable
as String,wordType: null == wordType ? _self.wordType : wordType // ignore: cast_nullable_to_non_nullable
as String,article: freezed == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as String?,pluralDe: freezed == pluralDe ? _self.pluralDe : pluralDe // ignore: cast_nullable_to_non_nullable
as String?,pluralEn: freezed == pluralEn ? _self.pluralEn : pluralEn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
