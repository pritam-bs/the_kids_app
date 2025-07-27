// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoryEntity {

 String get title; String get content; String get englishTranslation;
/// Create a copy of StoryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryEntityCopyWith<StoryEntity> get copyWith => _$StoryEntityCopyWithImpl<StoryEntity>(this as StoryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryEntity&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.englishTranslation, englishTranslation) || other.englishTranslation == englishTranslation));
}


@override
int get hashCode => Object.hash(runtimeType,title,content,englishTranslation);

@override
String toString() {
  return 'StoryEntity(title: $title, content: $content, englishTranslation: $englishTranslation)';
}


}

/// @nodoc
abstract mixin class $StoryEntityCopyWith<$Res>  {
  factory $StoryEntityCopyWith(StoryEntity value, $Res Function(StoryEntity) _then) = _$StoryEntityCopyWithImpl;
@useResult
$Res call({
 String title, String content, String englishTranslation
});




}
/// @nodoc
class _$StoryEntityCopyWithImpl<$Res>
    implements $StoryEntityCopyWith<$Res> {
  _$StoryEntityCopyWithImpl(this._self, this._then);

  final StoryEntity _self;
  final $Res Function(StoryEntity) _then;

/// Create a copy of StoryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? content = null,Object? englishTranslation = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,englishTranslation: null == englishTranslation ? _self.englishTranslation : englishTranslation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StoryEntity].
extension StoryEntityPatterns on StoryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryEntity value)  $default,){
final _that = this;
switch (_that) {
case _StoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StoryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String content,  String englishTranslation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoryEntity() when $default != null:
return $default(_that.title,_that.content,_that.englishTranslation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String content,  String englishTranslation)  $default,) {final _that = this;
switch (_that) {
case _StoryEntity():
return $default(_that.title,_that.content,_that.englishTranslation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String content,  String englishTranslation)?  $default,) {final _that = this;
switch (_that) {
case _StoryEntity() when $default != null:
return $default(_that.title,_that.content,_that.englishTranslation);case _:
  return null;

}
}

}

/// @nodoc


class _StoryEntity implements StoryEntity {
  const _StoryEntity({required this.title, required this.content, required this.englishTranslation});
  

@override final  String title;
@override final  String content;
@override final  String englishTranslation;

/// Create a copy of StoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryEntityCopyWith<_StoryEntity> get copyWith => __$StoryEntityCopyWithImpl<_StoryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryEntity&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.englishTranslation, englishTranslation) || other.englishTranslation == englishTranslation));
}


@override
int get hashCode => Object.hash(runtimeType,title,content,englishTranslation);

@override
String toString() {
  return 'StoryEntity(title: $title, content: $content, englishTranslation: $englishTranslation)';
}


}

/// @nodoc
abstract mixin class _$StoryEntityCopyWith<$Res> implements $StoryEntityCopyWith<$Res> {
  factory _$StoryEntityCopyWith(_StoryEntity value, $Res Function(_StoryEntity) _then) = __$StoryEntityCopyWithImpl;
@override @useResult
$Res call({
 String title, String content, String englishTranslation
});




}
/// @nodoc
class __$StoryEntityCopyWithImpl<$Res>
    implements _$StoryEntityCopyWith<$Res> {
  __$StoryEntityCopyWithImpl(this._self, this._then);

  final _StoryEntity _self;
  final $Res Function(_StoryEntity) _then;

/// Create a copy of StoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? content = null,Object? englishTranslation = null,}) {
  return _then(_StoryEntity(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,englishTranslation: null == englishTranslation ? _self.englishTranslation : englishTranslation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
