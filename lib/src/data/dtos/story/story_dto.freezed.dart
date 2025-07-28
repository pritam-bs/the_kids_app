// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoryDto {

 String get titleGerman; String get contentGerman; String get titleEnglish; String get contentEnglish;
/// Create a copy of StoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryDtoCopyWith<StoryDto> get copyWith => _$StoryDtoCopyWithImpl<StoryDto>(this as StoryDto, _$identity);

  /// Serializes this StoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryDto&&(identical(other.titleGerman, titleGerman) || other.titleGerman == titleGerman)&&(identical(other.contentGerman, contentGerman) || other.contentGerman == contentGerman)&&(identical(other.titleEnglish, titleEnglish) || other.titleEnglish == titleEnglish)&&(identical(other.contentEnglish, contentEnglish) || other.contentEnglish == contentEnglish));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,titleGerman,contentGerman,titleEnglish,contentEnglish);

@override
String toString() {
  return 'StoryDto(titleGerman: $titleGerman, contentGerman: $contentGerman, titleEnglish: $titleEnglish, contentEnglish: $contentEnglish)';
}


}

/// @nodoc
abstract mixin class $StoryDtoCopyWith<$Res>  {
  factory $StoryDtoCopyWith(StoryDto value, $Res Function(StoryDto) _then) = _$StoryDtoCopyWithImpl;
@useResult
$Res call({
 String titleGerman, String contentGerman, String titleEnglish, String contentEnglish
});




}
/// @nodoc
class _$StoryDtoCopyWithImpl<$Res>
    implements $StoryDtoCopyWith<$Res> {
  _$StoryDtoCopyWithImpl(this._self, this._then);

  final StoryDto _self;
  final $Res Function(StoryDto) _then;

/// Create a copy of StoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? titleGerman = null,Object? contentGerman = null,Object? titleEnglish = null,Object? contentEnglish = null,}) {
  return _then(_self.copyWith(
titleGerman: null == titleGerman ? _self.titleGerman : titleGerman // ignore: cast_nullable_to_non_nullable
as String,contentGerman: null == contentGerman ? _self.contentGerman : contentGerman // ignore: cast_nullable_to_non_nullable
as String,titleEnglish: null == titleEnglish ? _self.titleEnglish : titleEnglish // ignore: cast_nullable_to_non_nullable
as String,contentEnglish: null == contentEnglish ? _self.contentEnglish : contentEnglish // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StoryDto].
extension StoryDtoPatterns on StoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryDto value)  $default,){
final _that = this;
switch (_that) {
case _StoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _StoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String titleGerman,  String contentGerman,  String titleEnglish,  String contentEnglish)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoryDto() when $default != null:
return $default(_that.titleGerman,_that.contentGerman,_that.titleEnglish,_that.contentEnglish);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String titleGerman,  String contentGerman,  String titleEnglish,  String contentEnglish)  $default,) {final _that = this;
switch (_that) {
case _StoryDto():
return $default(_that.titleGerman,_that.contentGerman,_that.titleEnglish,_that.contentEnglish);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String titleGerman,  String contentGerman,  String titleEnglish,  String contentEnglish)?  $default,) {final _that = this;
switch (_that) {
case _StoryDto() when $default != null:
return $default(_that.titleGerman,_that.contentGerman,_that.titleEnglish,_that.contentEnglish);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoryDto implements StoryDto {
  const _StoryDto({required this.titleGerman, required this.contentGerman, required this.titleEnglish, required this.contentEnglish});
  factory _StoryDto.fromJson(Map<String, dynamic> json) => _$StoryDtoFromJson(json);

@override final  String titleGerman;
@override final  String contentGerman;
@override final  String titleEnglish;
@override final  String contentEnglish;

/// Create a copy of StoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryDtoCopyWith<_StoryDto> get copyWith => __$StoryDtoCopyWithImpl<_StoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryDto&&(identical(other.titleGerman, titleGerman) || other.titleGerman == titleGerman)&&(identical(other.contentGerman, contentGerman) || other.contentGerman == contentGerman)&&(identical(other.titleEnglish, titleEnglish) || other.titleEnglish == titleEnglish)&&(identical(other.contentEnglish, contentEnglish) || other.contentEnglish == contentEnglish));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,titleGerman,contentGerman,titleEnglish,contentEnglish);

@override
String toString() {
  return 'StoryDto(titleGerman: $titleGerman, contentGerman: $contentGerman, titleEnglish: $titleEnglish, contentEnglish: $contentEnglish)';
}


}

/// @nodoc
abstract mixin class _$StoryDtoCopyWith<$Res> implements $StoryDtoCopyWith<$Res> {
  factory _$StoryDtoCopyWith(_StoryDto value, $Res Function(_StoryDto) _then) = __$StoryDtoCopyWithImpl;
@override @useResult
$Res call({
 String titleGerman, String contentGerman, String titleEnglish, String contentEnglish
});




}
/// @nodoc
class __$StoryDtoCopyWithImpl<$Res>
    implements _$StoryDtoCopyWith<$Res> {
  __$StoryDtoCopyWithImpl(this._self, this._then);

  final _StoryDto _self;
  final $Res Function(_StoryDto) _then;

/// Create a copy of StoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? titleGerman = null,Object? contentGerman = null,Object? titleEnglish = null,Object? contentEnglish = null,}) {
  return _then(_StoryDto(
titleGerman: null == titleGerman ? _self.titleGerman : titleGerman // ignore: cast_nullable_to_non_nullable
as String,contentGerman: null == contentGerman ? _self.contentGerman : contentGerman // ignore: cast_nullable_to_non_nullable
as String,titleEnglish: null == titleEnglish ? _self.titleEnglish : titleEnglish // ignore: cast_nullable_to_non_nullable
as String,contentEnglish: null == contentEnglish ? _self.contentEnglish : contentEnglish // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
