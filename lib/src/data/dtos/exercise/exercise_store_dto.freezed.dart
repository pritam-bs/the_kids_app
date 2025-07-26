// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_store_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExerciseStoreDto {

@Id() int get id;@Id() set id(int value); String get exerciseType; set exerciseType(String value); String get jsonContent; set jsonContent(String value);
/// Create a copy of ExerciseStoreDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseStoreDtoCopyWith<ExerciseStoreDto> get copyWith => _$ExerciseStoreDtoCopyWithImpl<ExerciseStoreDto>(this as ExerciseStoreDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseStoreDto&&(identical(other.id, id) || other.id == id)&&(identical(other.exerciseType, exerciseType) || other.exerciseType == exerciseType)&&(identical(other.jsonContent, jsonContent) || other.jsonContent == jsonContent));
}


@override
int get hashCode => Object.hash(runtimeType,id,exerciseType,jsonContent);

@override
String toString() {
  return 'ExerciseStoreDto(id: $id, exerciseType: $exerciseType, jsonContent: $jsonContent)';
}


}

/// @nodoc
abstract mixin class $ExerciseStoreDtoCopyWith<$Res>  {
  factory $ExerciseStoreDtoCopyWith(ExerciseStoreDto value, $Res Function(ExerciseStoreDto) _then) = _$ExerciseStoreDtoCopyWithImpl;
@useResult
$Res call({
@Id() int id, String exerciseType, String jsonContent
});




}
/// @nodoc
class _$ExerciseStoreDtoCopyWithImpl<$Res>
    implements $ExerciseStoreDtoCopyWith<$Res> {
  _$ExerciseStoreDtoCopyWithImpl(this._self, this._then);

  final ExerciseStoreDto _self;
  final $Res Function(ExerciseStoreDto) _then;

/// Create a copy of ExerciseStoreDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? exerciseType = null,Object? jsonContent = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,exerciseType: null == exerciseType ? _self.exerciseType : exerciseType // ignore: cast_nullable_to_non_nullable
as String,jsonContent: null == jsonContent ? _self.jsonContent : jsonContent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExerciseStoreDto].
extension ExerciseStoreDtoPatterns on ExerciseStoreDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseStoreDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseStoreDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseStoreDto value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseStoreDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseStoreDto value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseStoreDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@Id()  int id,  String exerciseType,  String jsonContent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseStoreDto() when $default != null:
return $default(_that.id,_that.exerciseType,_that.jsonContent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@Id()  int id,  String exerciseType,  String jsonContent)  $default,) {final _that = this;
switch (_that) {
case _ExerciseStoreDto():
return $default(_that.id,_that.exerciseType,_that.jsonContent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@Id()  int id,  String exerciseType,  String jsonContent)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseStoreDto() when $default != null:
return $default(_that.id,_that.exerciseType,_that.jsonContent);case _:
  return null;

}
}

}

/// @nodoc

@Entity(realClass: ExerciseStoreDto)
class _ExerciseStoreDto implements ExerciseStoreDto {
   _ExerciseStoreDto({@Id() this.id = 0, required this.exerciseType, required this.jsonContent});
  

@override@JsonKey()@Id()  int id;
@override  String exerciseType;
@override  String jsonContent;

/// Create a copy of ExerciseStoreDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseStoreDtoCopyWith<_ExerciseStoreDto> get copyWith => __$ExerciseStoreDtoCopyWithImpl<_ExerciseStoreDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseStoreDto&&(identical(other.id, id) || other.id == id)&&(identical(other.exerciseType, exerciseType) || other.exerciseType == exerciseType)&&(identical(other.jsonContent, jsonContent) || other.jsonContent == jsonContent));
}


@override
int get hashCode => Object.hash(runtimeType,id,exerciseType,jsonContent);

@override
String toString() {
  return 'ExerciseStoreDto(id: $id, exerciseType: $exerciseType, jsonContent: $jsonContent)';
}


}

/// @nodoc
abstract mixin class _$ExerciseStoreDtoCopyWith<$Res> implements $ExerciseStoreDtoCopyWith<$Res> {
  factory _$ExerciseStoreDtoCopyWith(_ExerciseStoreDto value, $Res Function(_ExerciseStoreDto) _then) = __$ExerciseStoreDtoCopyWithImpl;
@override @useResult
$Res call({
@Id() int id, String exerciseType, String jsonContent
});




}
/// @nodoc
class __$ExerciseStoreDtoCopyWithImpl<$Res>
    implements _$ExerciseStoreDtoCopyWith<$Res> {
  __$ExerciseStoreDtoCopyWithImpl(this._self, this._then);

  final _ExerciseStoreDto _self;
  final $Res Function(_ExerciseStoreDto) _then;

/// Create a copy of ExerciseStoreDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? exerciseType = null,Object? jsonContent = null,}) {
  return _then(_ExerciseStoreDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,exerciseType: null == exerciseType ? _self.exerciseType : exerciseType // ignore: cast_nullable_to_non_nullable
as String,jsonContent: null == jsonContent ? _self.jsonContent : jsonContent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
