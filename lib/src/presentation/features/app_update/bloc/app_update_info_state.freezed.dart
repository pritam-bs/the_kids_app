// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppUpdateInfoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUpdateInfoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUpdateInfoState()';
}


}

/// @nodoc
class $AppUpdateInfoStateCopyWith<$Res>  {
$AppUpdateInfoStateCopyWith(AppUpdateInfoState _, $Res Function(AppUpdateInfoState) __);
}


/// Adds pattern-matching-related methods to [AppUpdateInfoState].
extension AppUpdateInfoStatePatterns on AppUpdateInfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( UpdateInfo value)?  updateInfo,TResult Function( UpdateSkipped value)?  updateSkipped,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case UpdateInfo() when updateInfo != null:
return updateInfo(_that);case UpdateSkipped() when updateSkipped != null:
return updateSkipped(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( UpdateInfo value)  updateInfo,required TResult Function( UpdateSkipped value)  updateSkipped,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case UpdateInfo():
return updateInfo(_that);case UpdateSkipped():
return updateSkipped(_that);case Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( UpdateInfo value)?  updateInfo,TResult? Function( UpdateSkipped value)?  updateSkipped,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case UpdateInfo() when updateInfo != null:
return updateInfo(_that);case UpdateSkipped() when updateSkipped != null:
return updateSkipped(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( AppUpdateInfoEntity appUpdateInfo)?  updateInfo,TResult Function()?  updateSkipped,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case UpdateInfo() when updateInfo != null:
return updateInfo(_that.appUpdateInfo);case UpdateSkipped() when updateSkipped != null:
return updateSkipped();case Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( AppUpdateInfoEntity appUpdateInfo)  updateInfo,required TResult Function()  updateSkipped,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case UpdateInfo():
return updateInfo(_that.appUpdateInfo);case UpdateSkipped():
return updateSkipped();case Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( AppUpdateInfoEntity appUpdateInfo)?  updateInfo,TResult? Function()?  updateSkipped,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case UpdateInfo() when updateInfo != null:
return updateInfo(_that.appUpdateInfo);case UpdateSkipped() when updateSkipped != null:
return updateSkipped();case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements AppUpdateInfoState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUpdateInfoState.initial()';
}


}




/// @nodoc


class UpdateInfo implements AppUpdateInfoState {
  const UpdateInfo({required this.appUpdateInfo});
  

 final  AppUpdateInfoEntity appUpdateInfo;

/// Create a copy of AppUpdateInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateInfoCopyWith<UpdateInfo> get copyWith => _$UpdateInfoCopyWithImpl<UpdateInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateInfo&&(identical(other.appUpdateInfo, appUpdateInfo) || other.appUpdateInfo == appUpdateInfo));
}


@override
int get hashCode => Object.hash(runtimeType,appUpdateInfo);

@override
String toString() {
  return 'AppUpdateInfoState.updateInfo(appUpdateInfo: $appUpdateInfo)';
}


}

/// @nodoc
abstract mixin class $UpdateInfoCopyWith<$Res> implements $AppUpdateInfoStateCopyWith<$Res> {
  factory $UpdateInfoCopyWith(UpdateInfo value, $Res Function(UpdateInfo) _then) = _$UpdateInfoCopyWithImpl;
@useResult
$Res call({
 AppUpdateInfoEntity appUpdateInfo
});


$AppUpdateInfoEntityCopyWith<$Res> get appUpdateInfo;

}
/// @nodoc
class _$UpdateInfoCopyWithImpl<$Res>
    implements $UpdateInfoCopyWith<$Res> {
  _$UpdateInfoCopyWithImpl(this._self, this._then);

  final UpdateInfo _self;
  final $Res Function(UpdateInfo) _then;

/// Create a copy of AppUpdateInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appUpdateInfo = null,}) {
  return _then(UpdateInfo(
appUpdateInfo: null == appUpdateInfo ? _self.appUpdateInfo : appUpdateInfo // ignore: cast_nullable_to_non_nullable
as AppUpdateInfoEntity,
  ));
}

/// Create a copy of AppUpdateInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUpdateInfoEntityCopyWith<$Res> get appUpdateInfo {
  
  return $AppUpdateInfoEntityCopyWith<$Res>(_self.appUpdateInfo, (value) {
    return _then(_self.copyWith(appUpdateInfo: value));
  });
}
}

/// @nodoc


class UpdateSkipped implements AppUpdateInfoState {
  const UpdateSkipped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSkipped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUpdateInfoState.updateSkipped()';
}


}




/// @nodoc


class Error implements AppUpdateInfoState {
  const Error({required this.message});
  

 final  String message;

/// Create a copy of AppUpdateInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppUpdateInfoState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $AppUpdateInfoStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of AppUpdateInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
