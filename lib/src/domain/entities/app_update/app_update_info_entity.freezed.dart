// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppUpdateInfoEntity {

 String get currentVersion; String get minimumSupportedVersion; String get latestVersion; bool get shouldForceUpdate; bool get shouldRecommendUpdate; String get releaseNotes; String? get storeUrl;
/// Create a copy of AppUpdateInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUpdateInfoEntityCopyWith<AppUpdateInfoEntity> get copyWith => _$AppUpdateInfoEntityCopyWithImpl<AppUpdateInfoEntity>(this as AppUpdateInfoEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUpdateInfoEntity&&(identical(other.currentVersion, currentVersion) || other.currentVersion == currentVersion)&&(identical(other.minimumSupportedVersion, minimumSupportedVersion) || other.minimumSupportedVersion == minimumSupportedVersion)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&(identical(other.shouldForceUpdate, shouldForceUpdate) || other.shouldForceUpdate == shouldForceUpdate)&&(identical(other.shouldRecommendUpdate, shouldRecommendUpdate) || other.shouldRecommendUpdate == shouldRecommendUpdate)&&(identical(other.releaseNotes, releaseNotes) || other.releaseNotes == releaseNotes)&&(identical(other.storeUrl, storeUrl) || other.storeUrl == storeUrl));
}


@override
int get hashCode => Object.hash(runtimeType,currentVersion,minimumSupportedVersion,latestVersion,shouldForceUpdate,shouldRecommendUpdate,releaseNotes,storeUrl);

@override
String toString() {
  return 'AppUpdateInfoEntity(currentVersion: $currentVersion, minimumSupportedVersion: $minimumSupportedVersion, latestVersion: $latestVersion, shouldForceUpdate: $shouldForceUpdate, shouldRecommendUpdate: $shouldRecommendUpdate, releaseNotes: $releaseNotes, storeUrl: $storeUrl)';
}


}

/// @nodoc
abstract mixin class $AppUpdateInfoEntityCopyWith<$Res>  {
  factory $AppUpdateInfoEntityCopyWith(AppUpdateInfoEntity value, $Res Function(AppUpdateInfoEntity) _then) = _$AppUpdateInfoEntityCopyWithImpl;
@useResult
$Res call({
 String currentVersion, String minimumSupportedVersion, String latestVersion, bool shouldForceUpdate, bool shouldRecommendUpdate, String releaseNotes, String? storeUrl
});




}
/// @nodoc
class _$AppUpdateInfoEntityCopyWithImpl<$Res>
    implements $AppUpdateInfoEntityCopyWith<$Res> {
  _$AppUpdateInfoEntityCopyWithImpl(this._self, this._then);

  final AppUpdateInfoEntity _self;
  final $Res Function(AppUpdateInfoEntity) _then;

/// Create a copy of AppUpdateInfoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentVersion = null,Object? minimumSupportedVersion = null,Object? latestVersion = null,Object? shouldForceUpdate = null,Object? shouldRecommendUpdate = null,Object? releaseNotes = null,Object? storeUrl = freezed,}) {
  return _then(_self.copyWith(
currentVersion: null == currentVersion ? _self.currentVersion : currentVersion // ignore: cast_nullable_to_non_nullable
as String,minimumSupportedVersion: null == minimumSupportedVersion ? _self.minimumSupportedVersion : minimumSupportedVersion // ignore: cast_nullable_to_non_nullable
as String,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,shouldForceUpdate: null == shouldForceUpdate ? _self.shouldForceUpdate : shouldForceUpdate // ignore: cast_nullable_to_non_nullable
as bool,shouldRecommendUpdate: null == shouldRecommendUpdate ? _self.shouldRecommendUpdate : shouldRecommendUpdate // ignore: cast_nullable_to_non_nullable
as bool,releaseNotes: null == releaseNotes ? _self.releaseNotes : releaseNotes // ignore: cast_nullable_to_non_nullable
as String,storeUrl: freezed == storeUrl ? _self.storeUrl : storeUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppUpdateInfoEntity].
extension AppUpdateInfoEntityPatterns on AppUpdateInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUpdateInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUpdateInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUpdateInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _AppUpdateInfoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUpdateInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AppUpdateInfoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currentVersion,  String minimumSupportedVersion,  String latestVersion,  bool shouldForceUpdate,  bool shouldRecommendUpdate,  String releaseNotes,  String? storeUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUpdateInfoEntity() when $default != null:
return $default(_that.currentVersion,_that.minimumSupportedVersion,_that.latestVersion,_that.shouldForceUpdate,_that.shouldRecommendUpdate,_that.releaseNotes,_that.storeUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currentVersion,  String minimumSupportedVersion,  String latestVersion,  bool shouldForceUpdate,  bool shouldRecommendUpdate,  String releaseNotes,  String? storeUrl)  $default,) {final _that = this;
switch (_that) {
case _AppUpdateInfoEntity():
return $default(_that.currentVersion,_that.minimumSupportedVersion,_that.latestVersion,_that.shouldForceUpdate,_that.shouldRecommendUpdate,_that.releaseNotes,_that.storeUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currentVersion,  String minimumSupportedVersion,  String latestVersion,  bool shouldForceUpdate,  bool shouldRecommendUpdate,  String releaseNotes,  String? storeUrl)?  $default,) {final _that = this;
switch (_that) {
case _AppUpdateInfoEntity() when $default != null:
return $default(_that.currentVersion,_that.minimumSupportedVersion,_that.latestVersion,_that.shouldForceUpdate,_that.shouldRecommendUpdate,_that.releaseNotes,_that.storeUrl);case _:
  return null;

}
}

}

/// @nodoc


class _AppUpdateInfoEntity implements AppUpdateInfoEntity {
  const _AppUpdateInfoEntity({required this.currentVersion, required this.minimumSupportedVersion, required this.latestVersion, required this.shouldForceUpdate, required this.shouldRecommendUpdate, required this.releaseNotes, required this.storeUrl});
  

@override final  String currentVersion;
@override final  String minimumSupportedVersion;
@override final  String latestVersion;
@override final  bool shouldForceUpdate;
@override final  bool shouldRecommendUpdate;
@override final  String releaseNotes;
@override final  String? storeUrl;

/// Create a copy of AppUpdateInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUpdateInfoEntityCopyWith<_AppUpdateInfoEntity> get copyWith => __$AppUpdateInfoEntityCopyWithImpl<_AppUpdateInfoEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUpdateInfoEntity&&(identical(other.currentVersion, currentVersion) || other.currentVersion == currentVersion)&&(identical(other.minimumSupportedVersion, minimumSupportedVersion) || other.minimumSupportedVersion == minimumSupportedVersion)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&(identical(other.shouldForceUpdate, shouldForceUpdate) || other.shouldForceUpdate == shouldForceUpdate)&&(identical(other.shouldRecommendUpdate, shouldRecommendUpdate) || other.shouldRecommendUpdate == shouldRecommendUpdate)&&(identical(other.releaseNotes, releaseNotes) || other.releaseNotes == releaseNotes)&&(identical(other.storeUrl, storeUrl) || other.storeUrl == storeUrl));
}


@override
int get hashCode => Object.hash(runtimeType,currentVersion,minimumSupportedVersion,latestVersion,shouldForceUpdate,shouldRecommendUpdate,releaseNotes,storeUrl);

@override
String toString() {
  return 'AppUpdateInfoEntity(currentVersion: $currentVersion, minimumSupportedVersion: $minimumSupportedVersion, latestVersion: $latestVersion, shouldForceUpdate: $shouldForceUpdate, shouldRecommendUpdate: $shouldRecommendUpdate, releaseNotes: $releaseNotes, storeUrl: $storeUrl)';
}


}

/// @nodoc
abstract mixin class _$AppUpdateInfoEntityCopyWith<$Res> implements $AppUpdateInfoEntityCopyWith<$Res> {
  factory _$AppUpdateInfoEntityCopyWith(_AppUpdateInfoEntity value, $Res Function(_AppUpdateInfoEntity) _then) = __$AppUpdateInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 String currentVersion, String minimumSupportedVersion, String latestVersion, bool shouldForceUpdate, bool shouldRecommendUpdate, String releaseNotes, String? storeUrl
});




}
/// @nodoc
class __$AppUpdateInfoEntityCopyWithImpl<$Res>
    implements _$AppUpdateInfoEntityCopyWith<$Res> {
  __$AppUpdateInfoEntityCopyWithImpl(this._self, this._then);

  final _AppUpdateInfoEntity _self;
  final $Res Function(_AppUpdateInfoEntity) _then;

/// Create a copy of AppUpdateInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentVersion = null,Object? minimumSupportedVersion = null,Object? latestVersion = null,Object? shouldForceUpdate = null,Object? shouldRecommendUpdate = null,Object? releaseNotes = null,Object? storeUrl = freezed,}) {
  return _then(_AppUpdateInfoEntity(
currentVersion: null == currentVersion ? _self.currentVersion : currentVersion // ignore: cast_nullable_to_non_nullable
as String,minimumSupportedVersion: null == minimumSupportedVersion ? _self.minimumSupportedVersion : minimumSupportedVersion // ignore: cast_nullable_to_non_nullable
as String,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,shouldForceUpdate: null == shouldForceUpdate ? _self.shouldForceUpdate : shouldForceUpdate // ignore: cast_nullable_to_non_nullable
as bool,shouldRecommendUpdate: null == shouldRecommendUpdate ? _self.shouldRecommendUpdate : shouldRecommendUpdate // ignore: cast_nullable_to_non_nullable
as bool,releaseNotes: null == releaseNotes ? _self.releaseNotes : releaseNotes // ignore: cast_nullable_to_non_nullable
as String,storeUrl: freezed == storeUrl ? _self.storeUrl : storeUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
