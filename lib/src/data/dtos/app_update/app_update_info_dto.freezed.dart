// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUpdateInfoDto {

 String get minimumSupportedVersion; String get latestVersion; String get releaseNotes; String? get storeUrl;
/// Create a copy of AppUpdateInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUpdateInfoDtoCopyWith<AppUpdateInfoDto> get copyWith => _$AppUpdateInfoDtoCopyWithImpl<AppUpdateInfoDto>(this as AppUpdateInfoDto, _$identity);

  /// Serializes this AppUpdateInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUpdateInfoDto&&(identical(other.minimumSupportedVersion, minimumSupportedVersion) || other.minimumSupportedVersion == minimumSupportedVersion)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&(identical(other.releaseNotes, releaseNotes) || other.releaseNotes == releaseNotes)&&(identical(other.storeUrl, storeUrl) || other.storeUrl == storeUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minimumSupportedVersion,latestVersion,releaseNotes,storeUrl);

@override
String toString() {
  return 'AppUpdateInfoDto(minimumSupportedVersion: $minimumSupportedVersion, latestVersion: $latestVersion, releaseNotes: $releaseNotes, storeUrl: $storeUrl)';
}


}

/// @nodoc
abstract mixin class $AppUpdateInfoDtoCopyWith<$Res>  {
  factory $AppUpdateInfoDtoCopyWith(AppUpdateInfoDto value, $Res Function(AppUpdateInfoDto) _then) = _$AppUpdateInfoDtoCopyWithImpl;
@useResult
$Res call({
 String minimumSupportedVersion, String latestVersion, String releaseNotes, String? storeUrl
});




}
/// @nodoc
class _$AppUpdateInfoDtoCopyWithImpl<$Res>
    implements $AppUpdateInfoDtoCopyWith<$Res> {
  _$AppUpdateInfoDtoCopyWithImpl(this._self, this._then);

  final AppUpdateInfoDto _self;
  final $Res Function(AppUpdateInfoDto) _then;

/// Create a copy of AppUpdateInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minimumSupportedVersion = null,Object? latestVersion = null,Object? releaseNotes = null,Object? storeUrl = freezed,}) {
  return _then(_self.copyWith(
minimumSupportedVersion: null == minimumSupportedVersion ? _self.minimumSupportedVersion : minimumSupportedVersion // ignore: cast_nullable_to_non_nullable
as String,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,releaseNotes: null == releaseNotes ? _self.releaseNotes : releaseNotes // ignore: cast_nullable_to_non_nullable
as String,storeUrl: freezed == storeUrl ? _self.storeUrl : storeUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppUpdateInfoDto].
extension AppUpdateInfoDtoPatterns on AppUpdateInfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUpdateInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUpdateInfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUpdateInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _AppUpdateInfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUpdateInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _AppUpdateInfoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String minimumSupportedVersion,  String latestVersion,  String releaseNotes,  String? storeUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUpdateInfoDto() when $default != null:
return $default(_that.minimumSupportedVersion,_that.latestVersion,_that.releaseNotes,_that.storeUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String minimumSupportedVersion,  String latestVersion,  String releaseNotes,  String? storeUrl)  $default,) {final _that = this;
switch (_that) {
case _AppUpdateInfoDto():
return $default(_that.minimumSupportedVersion,_that.latestVersion,_that.releaseNotes,_that.storeUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String minimumSupportedVersion,  String latestVersion,  String releaseNotes,  String? storeUrl)?  $default,) {final _that = this;
switch (_that) {
case _AppUpdateInfoDto() when $default != null:
return $default(_that.minimumSupportedVersion,_that.latestVersion,_that.releaseNotes,_that.storeUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUpdateInfoDto implements AppUpdateInfoDto {
  const _AppUpdateInfoDto({required this.minimumSupportedVersion, required this.latestVersion, required this.releaseNotes, required this.storeUrl});
  factory _AppUpdateInfoDto.fromJson(Map<String, dynamic> json) => _$AppUpdateInfoDtoFromJson(json);

@override final  String minimumSupportedVersion;
@override final  String latestVersion;
@override final  String releaseNotes;
@override final  String? storeUrl;

/// Create a copy of AppUpdateInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUpdateInfoDtoCopyWith<_AppUpdateInfoDto> get copyWith => __$AppUpdateInfoDtoCopyWithImpl<_AppUpdateInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppUpdateInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUpdateInfoDto&&(identical(other.minimumSupportedVersion, minimumSupportedVersion) || other.minimumSupportedVersion == minimumSupportedVersion)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&(identical(other.releaseNotes, releaseNotes) || other.releaseNotes == releaseNotes)&&(identical(other.storeUrl, storeUrl) || other.storeUrl == storeUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minimumSupportedVersion,latestVersion,releaseNotes,storeUrl);

@override
String toString() {
  return 'AppUpdateInfoDto(minimumSupportedVersion: $minimumSupportedVersion, latestVersion: $latestVersion, releaseNotes: $releaseNotes, storeUrl: $storeUrl)';
}


}

/// @nodoc
abstract mixin class _$AppUpdateInfoDtoCopyWith<$Res> implements $AppUpdateInfoDtoCopyWith<$Res> {
  factory _$AppUpdateInfoDtoCopyWith(_AppUpdateInfoDto value, $Res Function(_AppUpdateInfoDto) _then) = __$AppUpdateInfoDtoCopyWithImpl;
@override @useResult
$Res call({
 String minimumSupportedVersion, String latestVersion, String releaseNotes, String? storeUrl
});




}
/// @nodoc
class __$AppUpdateInfoDtoCopyWithImpl<$Res>
    implements _$AppUpdateInfoDtoCopyWith<$Res> {
  __$AppUpdateInfoDtoCopyWithImpl(this._self, this._then);

  final _AppUpdateInfoDto _self;
  final $Res Function(_AppUpdateInfoDto) _then;

/// Create a copy of AppUpdateInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minimumSupportedVersion = null,Object? latestVersion = null,Object? releaseNotes = null,Object? storeUrl = freezed,}) {
  return _then(_AppUpdateInfoDto(
minimumSupportedVersion: null == minimumSupportedVersion ? _self.minimumSupportedVersion : minimumSupportedVersion // ignore: cast_nullable_to_non_nullable
as String,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,releaseNotes: null == releaseNotes ? _self.releaseNotes : releaseNotes // ignore: cast_nullable_to_non_nullable
as String,storeUrl: freezed == storeUrl ? _self.storeUrl : storeUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
