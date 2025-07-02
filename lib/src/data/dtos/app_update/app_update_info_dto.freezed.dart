// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
