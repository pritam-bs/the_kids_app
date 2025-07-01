// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
