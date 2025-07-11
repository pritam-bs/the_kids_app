// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_info_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppUpdateInfoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUpdateInfoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUpdateInfoEvent()';
}


}

/// @nodoc
class $AppUpdateInfoEventCopyWith<$Res>  {
$AppUpdateInfoEventCopyWith(AppUpdateInfoEvent _, $Res Function(AppUpdateInfoEvent) __);
}


/// Adds pattern-matching-related methods to [AppUpdateInfoEvent].
extension AppUpdateInfoEventPatterns on AppUpdateInfoEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnLoadAppUpdateInfo value)?  onLoadAppUpdateInfo,TResult Function( OnSkipUpdate value)?  onSkipUpdate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnLoadAppUpdateInfo() when onLoadAppUpdateInfo != null:
return onLoadAppUpdateInfo(_that);case OnSkipUpdate() when onSkipUpdate != null:
return onSkipUpdate(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnLoadAppUpdateInfo value)  onLoadAppUpdateInfo,required TResult Function( OnSkipUpdate value)  onSkipUpdate,}){
final _that = this;
switch (_that) {
case OnLoadAppUpdateInfo():
return onLoadAppUpdateInfo(_that);case OnSkipUpdate():
return onSkipUpdate(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnLoadAppUpdateInfo value)?  onLoadAppUpdateInfo,TResult? Function( OnSkipUpdate value)?  onSkipUpdate,}){
final _that = this;
switch (_that) {
case OnLoadAppUpdateInfo() when onLoadAppUpdateInfo != null:
return onLoadAppUpdateInfo(_that);case OnSkipUpdate() when onSkipUpdate != null:
return onSkipUpdate(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppUpdateInfoEntity appUpdateInfo)?  onLoadAppUpdateInfo,TResult Function( String version)?  onSkipUpdate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnLoadAppUpdateInfo() when onLoadAppUpdateInfo != null:
return onLoadAppUpdateInfo(_that.appUpdateInfo);case OnSkipUpdate() when onSkipUpdate != null:
return onSkipUpdate(_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppUpdateInfoEntity appUpdateInfo)  onLoadAppUpdateInfo,required TResult Function( String version)  onSkipUpdate,}) {final _that = this;
switch (_that) {
case OnLoadAppUpdateInfo():
return onLoadAppUpdateInfo(_that.appUpdateInfo);case OnSkipUpdate():
return onSkipUpdate(_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppUpdateInfoEntity appUpdateInfo)?  onLoadAppUpdateInfo,TResult? Function( String version)?  onSkipUpdate,}) {final _that = this;
switch (_that) {
case OnLoadAppUpdateInfo() when onLoadAppUpdateInfo != null:
return onLoadAppUpdateInfo(_that.appUpdateInfo);case OnSkipUpdate() when onSkipUpdate != null:
return onSkipUpdate(_that.version);case _:
  return null;

}
}

}

/// @nodoc


class OnLoadAppUpdateInfo implements AppUpdateInfoEvent {
  const OnLoadAppUpdateInfo({required this.appUpdateInfo});
  

 final  AppUpdateInfoEntity appUpdateInfo;

/// Create a copy of AppUpdateInfoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnLoadAppUpdateInfoCopyWith<OnLoadAppUpdateInfo> get copyWith => _$OnLoadAppUpdateInfoCopyWithImpl<OnLoadAppUpdateInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnLoadAppUpdateInfo&&(identical(other.appUpdateInfo, appUpdateInfo) || other.appUpdateInfo == appUpdateInfo));
}


@override
int get hashCode => Object.hash(runtimeType,appUpdateInfo);

@override
String toString() {
  return 'AppUpdateInfoEvent.onLoadAppUpdateInfo(appUpdateInfo: $appUpdateInfo)';
}


}

/// @nodoc
abstract mixin class $OnLoadAppUpdateInfoCopyWith<$Res> implements $AppUpdateInfoEventCopyWith<$Res> {
  factory $OnLoadAppUpdateInfoCopyWith(OnLoadAppUpdateInfo value, $Res Function(OnLoadAppUpdateInfo) _then) = _$OnLoadAppUpdateInfoCopyWithImpl;
@useResult
$Res call({
 AppUpdateInfoEntity appUpdateInfo
});


$AppUpdateInfoEntityCopyWith<$Res> get appUpdateInfo;

}
/// @nodoc
class _$OnLoadAppUpdateInfoCopyWithImpl<$Res>
    implements $OnLoadAppUpdateInfoCopyWith<$Res> {
  _$OnLoadAppUpdateInfoCopyWithImpl(this._self, this._then);

  final OnLoadAppUpdateInfo _self;
  final $Res Function(OnLoadAppUpdateInfo) _then;

/// Create a copy of AppUpdateInfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appUpdateInfo = null,}) {
  return _then(OnLoadAppUpdateInfo(
appUpdateInfo: null == appUpdateInfo ? _self.appUpdateInfo : appUpdateInfo // ignore: cast_nullable_to_non_nullable
as AppUpdateInfoEntity,
  ));
}

/// Create a copy of AppUpdateInfoEvent
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


class OnSkipUpdate implements AppUpdateInfoEvent {
  const OnSkipUpdate(this.version);
  

 final  String version;

/// Create a copy of AppUpdateInfoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnSkipUpdateCopyWith<OnSkipUpdate> get copyWith => _$OnSkipUpdateCopyWithImpl<OnSkipUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSkipUpdate&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'AppUpdateInfoEvent.onSkipUpdate(version: $version)';
}


}

/// @nodoc
abstract mixin class $OnSkipUpdateCopyWith<$Res> implements $AppUpdateInfoEventCopyWith<$Res> {
  factory $OnSkipUpdateCopyWith(OnSkipUpdate value, $Res Function(OnSkipUpdate) _then) = _$OnSkipUpdateCopyWithImpl;
@useResult
$Res call({
 String version
});




}
/// @nodoc
class _$OnSkipUpdateCopyWithImpl<$Res>
    implements $OnSkipUpdateCopyWith<$Res> {
  _$OnSkipUpdateCopyWithImpl(this._self, this._then);

  final OnSkipUpdate _self;
  final $Res Function(OnSkipUpdate) _then;

/// Create a copy of AppUpdateInfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? version = null,}) {
  return _then(OnSkipUpdate(
null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
