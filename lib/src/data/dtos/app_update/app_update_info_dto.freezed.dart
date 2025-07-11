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
mixin _$AppUpdateInfoDTO {

 String get minimumSupportedVersion; String get latestVersion; String get releaseNotes; String? get storeUrl;
/// Create a copy of AppUpdateInfoDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUpdateInfoDTOCopyWith<AppUpdateInfoDTO> get copyWith => _$AppUpdateInfoDTOCopyWithImpl<AppUpdateInfoDTO>(this as AppUpdateInfoDTO, _$identity);

  /// Serializes this AppUpdateInfoDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUpdateInfoDTO&&(identical(other.minimumSupportedVersion, minimumSupportedVersion) || other.minimumSupportedVersion == minimumSupportedVersion)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&(identical(other.releaseNotes, releaseNotes) || other.releaseNotes == releaseNotes)&&(identical(other.storeUrl, storeUrl) || other.storeUrl == storeUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minimumSupportedVersion,latestVersion,releaseNotes,storeUrl);

@override
String toString() {
  return 'AppUpdateInfoDTO(minimumSupportedVersion: $minimumSupportedVersion, latestVersion: $latestVersion, releaseNotes: $releaseNotes, storeUrl: $storeUrl)';
}


}

/// @nodoc
abstract mixin class $AppUpdateInfoDTOCopyWith<$Res>  {
  factory $AppUpdateInfoDTOCopyWith(AppUpdateInfoDTO value, $Res Function(AppUpdateInfoDTO) _then) = _$AppUpdateInfoDTOCopyWithImpl;
@useResult
$Res call({
 String minimumSupportedVersion, String latestVersion, String releaseNotes, String? storeUrl
});




}
/// @nodoc
class _$AppUpdateInfoDTOCopyWithImpl<$Res>
    implements $AppUpdateInfoDTOCopyWith<$Res> {
  _$AppUpdateInfoDTOCopyWithImpl(this._self, this._then);

  final AppUpdateInfoDTO _self;
  final $Res Function(AppUpdateInfoDTO) _then;

/// Create a copy of AppUpdateInfoDTO
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


/// Adds pattern-matching-related methods to [AppUpdateInfoDTO].
extension AppUpdateInfoDTOPatterns on AppUpdateInfoDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUpdateInfoDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUpdateInfoDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUpdateInfoDTO value)  $default,){
final _that = this;
switch (_that) {
case _AppUpdateInfoDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUpdateInfoDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AppUpdateInfoDTO() when $default != null:
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
case _AppUpdateInfoDTO() when $default != null:
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
case _AppUpdateInfoDTO():
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
case _AppUpdateInfoDTO() when $default != null:
return $default(_that.minimumSupportedVersion,_that.latestVersion,_that.releaseNotes,_that.storeUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUpdateInfoDTO implements AppUpdateInfoDTO {
  const _AppUpdateInfoDTO({required this.minimumSupportedVersion, required this.latestVersion, required this.releaseNotes, required this.storeUrl});
  factory _AppUpdateInfoDTO.fromJson(Map<String, dynamic> json) => _$AppUpdateInfoDTOFromJson(json);

@override final  String minimumSupportedVersion;
@override final  String latestVersion;
@override final  String releaseNotes;
@override final  String? storeUrl;

/// Create a copy of AppUpdateInfoDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUpdateInfoDTOCopyWith<_AppUpdateInfoDTO> get copyWith => __$AppUpdateInfoDTOCopyWithImpl<_AppUpdateInfoDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppUpdateInfoDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUpdateInfoDTO&&(identical(other.minimumSupportedVersion, minimumSupportedVersion) || other.minimumSupportedVersion == minimumSupportedVersion)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&(identical(other.releaseNotes, releaseNotes) || other.releaseNotes == releaseNotes)&&(identical(other.storeUrl, storeUrl) || other.storeUrl == storeUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minimumSupportedVersion,latestVersion,releaseNotes,storeUrl);

@override
String toString() {
  return 'AppUpdateInfoDTO(minimumSupportedVersion: $minimumSupportedVersion, latestVersion: $latestVersion, releaseNotes: $releaseNotes, storeUrl: $storeUrl)';
}


}

/// @nodoc
abstract mixin class _$AppUpdateInfoDTOCopyWith<$Res> implements $AppUpdateInfoDTOCopyWith<$Res> {
  factory _$AppUpdateInfoDTOCopyWith(_AppUpdateInfoDTO value, $Res Function(_AppUpdateInfoDTO) _then) = __$AppUpdateInfoDTOCopyWithImpl;
@override @useResult
$Res call({
 String minimumSupportedVersion, String latestVersion, String releaseNotes, String? storeUrl
});




}
/// @nodoc
class __$AppUpdateInfoDTOCopyWithImpl<$Res>
    implements _$AppUpdateInfoDTOCopyWith<$Res> {
  __$AppUpdateInfoDTOCopyWithImpl(this._self, this._then);

  final _AppUpdateInfoDTO _self;
  final $Res Function(_AppUpdateInfoDTO) _then;

/// Create a copy of AppUpdateInfoDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minimumSupportedVersion = null,Object? latestVersion = null,Object? releaseNotes = null,Object? storeUrl = freezed,}) {
  return _then(_AppUpdateInfoDTO(
minimumSupportedVersion: null == minimumSupportedVersion ? _self.minimumSupportedVersion : minimumSupportedVersion // ignore: cast_nullable_to_non_nullable
as String,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,releaseNotes: null == releaseNotes ? _self.releaseNotes : releaseNotes // ignore: cast_nullable_to_non_nullable
as String,storeUrl: freezed == storeUrl ? _self.storeUrl : storeUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
