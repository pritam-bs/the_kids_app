// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModelInfoEntity {

 String get localPath; bool get isDownloaded;
/// Create a copy of ModelInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelInfoEntityCopyWith<ModelInfoEntity> get copyWith => _$ModelInfoEntityCopyWithImpl<ModelInfoEntity>(this as ModelInfoEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelInfoEntity&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.isDownloaded, isDownloaded) || other.isDownloaded == isDownloaded));
}


@override
int get hashCode => Object.hash(runtimeType,localPath,isDownloaded);

@override
String toString() {
  return 'ModelInfoEntity(localPath: $localPath, isDownloaded: $isDownloaded)';
}


}

/// @nodoc
abstract mixin class $ModelInfoEntityCopyWith<$Res>  {
  factory $ModelInfoEntityCopyWith(ModelInfoEntity value, $Res Function(ModelInfoEntity) _then) = _$ModelInfoEntityCopyWithImpl;
@useResult
$Res call({
 String localPath, bool isDownloaded
});




}
/// @nodoc
class _$ModelInfoEntityCopyWithImpl<$Res>
    implements $ModelInfoEntityCopyWith<$Res> {
  _$ModelInfoEntityCopyWithImpl(this._self, this._then);

  final ModelInfoEntity _self;
  final $Res Function(ModelInfoEntity) _then;

/// Create a copy of ModelInfoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localPath = null,Object? isDownloaded = null,}) {
  return _then(_self.copyWith(
localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,isDownloaded: null == isDownloaded ? _self.isDownloaded : isDownloaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelInfoEntity].
extension ModelInfoEntityPatterns on ModelInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _ModelInfoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ModelInfoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localPath,  bool isDownloaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelInfoEntity() when $default != null:
return $default(_that.localPath,_that.isDownloaded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localPath,  bool isDownloaded)  $default,) {final _that = this;
switch (_that) {
case _ModelInfoEntity():
return $default(_that.localPath,_that.isDownloaded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localPath,  bool isDownloaded)?  $default,) {final _that = this;
switch (_that) {
case _ModelInfoEntity() when $default != null:
return $default(_that.localPath,_that.isDownloaded);case _:
  return null;

}
}

}

/// @nodoc


class _ModelInfoEntity implements ModelInfoEntity {
  const _ModelInfoEntity({required this.localPath, required this.isDownloaded});
  

@override final  String localPath;
@override final  bool isDownloaded;

/// Create a copy of ModelInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelInfoEntityCopyWith<_ModelInfoEntity> get copyWith => __$ModelInfoEntityCopyWithImpl<_ModelInfoEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelInfoEntity&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.isDownloaded, isDownloaded) || other.isDownloaded == isDownloaded));
}


@override
int get hashCode => Object.hash(runtimeType,localPath,isDownloaded);

@override
String toString() {
  return 'ModelInfoEntity(localPath: $localPath, isDownloaded: $isDownloaded)';
}


}

/// @nodoc
abstract mixin class _$ModelInfoEntityCopyWith<$Res> implements $ModelInfoEntityCopyWith<$Res> {
  factory _$ModelInfoEntityCopyWith(_ModelInfoEntity value, $Res Function(_ModelInfoEntity) _then) = __$ModelInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 String localPath, bool isDownloaded
});




}
/// @nodoc
class __$ModelInfoEntityCopyWithImpl<$Res>
    implements _$ModelInfoEntityCopyWith<$Res> {
  __$ModelInfoEntityCopyWithImpl(this._self, this._then);

  final _ModelInfoEntity _self;
  final $Res Function(_ModelInfoEntity) _then;

/// Create a copy of ModelInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localPath = null,Object? isDownloaded = null,}) {
  return _then(_ModelInfoEntity(
localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,isDownloaded: null == isDownloaded ? _self.isDownloaded : isDownloaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
