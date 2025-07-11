// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_check_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppUpdateCheckState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUpdateCheckState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUpdateCheckState()';
}


}

/// @nodoc
class $AppUpdateCheckStateCopyWith<$Res>  {
$AppUpdateCheckStateCopyWith(AppUpdateCheckState _, $Res Function(AppUpdateCheckState) __);
}


/// Adds pattern-matching-related methods to [AppUpdateCheckState].
extension AppUpdateCheckStatePatterns on AppUpdateCheckState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Error value)?  error,TResult Function( UpToDate value)?  upToDate,TResult Function( UpdateSkipped value)?  updateSkipped,TResult Function( UpdateAvailable value)?  updateAvailable,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Error() when error != null:
return error(_that);case UpToDate() when upToDate != null:
return upToDate(_that);case UpdateSkipped() when updateSkipped != null:
return updateSkipped(_that);case UpdateAvailable() when updateAvailable != null:
return updateAvailable(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Error value)  error,required TResult Function( UpToDate value)  upToDate,required TResult Function( UpdateSkipped value)  updateSkipped,required TResult Function( UpdateAvailable value)  updateAvailable,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Error():
return error(_that);case UpToDate():
return upToDate(_that);case UpdateSkipped():
return updateSkipped(_that);case UpdateAvailable():
return updateAvailable(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Error value)?  error,TResult? Function( UpToDate value)?  upToDate,TResult? Function( UpdateSkipped value)?  updateSkipped,TResult? Function( UpdateAvailable value)?  updateAvailable,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Error() when error != null:
return error(_that);case UpToDate() when upToDate != null:
return upToDate(_that);case UpdateSkipped() when updateSkipped != null:
return updateSkipped(_that);case UpdateAvailable() when updateAvailable != null:
return updateAvailable(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String message)?  error,TResult Function()?  upToDate,TResult Function()?  updateSkipped,TResult Function( AppUpdateInfoEntity appUpdateInfo)?  updateAvailable,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Error() when error != null:
return error(_that.message);case UpToDate() when upToDate != null:
return upToDate();case UpdateSkipped() when updateSkipped != null:
return updateSkipped();case UpdateAvailable() when updateAvailable != null:
return updateAvailable(_that.appUpdateInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String message)  error,required TResult Function()  upToDate,required TResult Function()  updateSkipped,required TResult Function( AppUpdateInfoEntity appUpdateInfo)  updateAvailable,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Error():
return error(_that.message);case UpToDate():
return upToDate();case UpdateSkipped():
return updateSkipped();case UpdateAvailable():
return updateAvailable(_that.appUpdateInfo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String message)?  error,TResult? Function()?  upToDate,TResult? Function()?  updateSkipped,TResult? Function( AppUpdateInfoEntity appUpdateInfo)?  updateAvailable,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Error() when error != null:
return error(_that.message);case UpToDate() when upToDate != null:
return upToDate();case UpdateSkipped() when updateSkipped != null:
return updateSkipped();case UpdateAvailable() when updateAvailable != null:
return updateAvailable(_that.appUpdateInfo);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements AppUpdateCheckState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUpdateCheckState.initial()';
}


}




/// @nodoc


class Error implements AppUpdateCheckState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of AppUpdateCheckState
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
  return 'AppUpdateCheckState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $AppUpdateCheckStateCopyWith<$Res> {
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

/// Create a copy of AppUpdateCheckState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpToDate implements AppUpdateCheckState {
  const UpToDate();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpToDate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUpdateCheckState.upToDate()';
}


}




/// @nodoc


class UpdateSkipped implements AppUpdateCheckState {
  const UpdateSkipped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSkipped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUpdateCheckState.updateSkipped()';
}


}




/// @nodoc


class UpdateAvailable implements AppUpdateCheckState {
  const UpdateAvailable(this.appUpdateInfo);
  

 final  AppUpdateInfoEntity appUpdateInfo;

/// Create a copy of AppUpdateCheckState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAvailableCopyWith<UpdateAvailable> get copyWith => _$UpdateAvailableCopyWithImpl<UpdateAvailable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAvailable&&(identical(other.appUpdateInfo, appUpdateInfo) || other.appUpdateInfo == appUpdateInfo));
}


@override
int get hashCode => Object.hash(runtimeType,appUpdateInfo);

@override
String toString() {
  return 'AppUpdateCheckState.updateAvailable(appUpdateInfo: $appUpdateInfo)';
}


}

/// @nodoc
abstract mixin class $UpdateAvailableCopyWith<$Res> implements $AppUpdateCheckStateCopyWith<$Res> {
  factory $UpdateAvailableCopyWith(UpdateAvailable value, $Res Function(UpdateAvailable) _then) = _$UpdateAvailableCopyWithImpl;
@useResult
$Res call({
 AppUpdateInfoEntity appUpdateInfo
});


$AppUpdateInfoEntityCopyWith<$Res> get appUpdateInfo;

}
/// @nodoc
class _$UpdateAvailableCopyWithImpl<$Res>
    implements $UpdateAvailableCopyWith<$Res> {
  _$UpdateAvailableCopyWithImpl(this._self, this._then);

  final UpdateAvailable _self;
  final $Res Function(UpdateAvailable) _then;

/// Create a copy of AppUpdateCheckState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appUpdateInfo = null,}) {
  return _then(UpdateAvailable(
null == appUpdateInfo ? _self.appUpdateInfo : appUpdateInfo // ignore: cast_nullable_to_non_nullable
as AppUpdateInfoEntity,
  ));
}

/// Create a copy of AppUpdateCheckState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUpdateInfoEntityCopyWith<$Res> get appUpdateInfo {
  
  return $AppUpdateInfoEntityCopyWith<$Res>(_self.appUpdateInfo, (value) {
    return _then(_self.copyWith(appUpdateInfo: value));
  });
}
}

// dart format on
