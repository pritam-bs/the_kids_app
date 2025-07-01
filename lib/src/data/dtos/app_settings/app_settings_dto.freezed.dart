// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettingsDto {

@JsonKey(name: 'last_skipped_version') String? get lastSkippedVersion;
/// Create a copy of AppSettingsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsDtoCopyWith<AppSettingsDto> get copyWith => _$AppSettingsDtoCopyWithImpl<AppSettingsDto>(this as AppSettingsDto, _$identity);

  /// Serializes this AppSettingsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingsDto&&(identical(other.lastSkippedVersion, lastSkippedVersion) || other.lastSkippedVersion == lastSkippedVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastSkippedVersion);

@override
String toString() {
  return 'AppSettingsDto(lastSkippedVersion: $lastSkippedVersion)';
}


}

/// @nodoc
abstract mixin class $AppSettingsDtoCopyWith<$Res>  {
  factory $AppSettingsDtoCopyWith(AppSettingsDto value, $Res Function(AppSettingsDto) _then) = _$AppSettingsDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'last_skipped_version') String? lastSkippedVersion
});




}
/// @nodoc
class _$AppSettingsDtoCopyWithImpl<$Res>
    implements $AppSettingsDtoCopyWith<$Res> {
  _$AppSettingsDtoCopyWithImpl(this._self, this._then);

  final AppSettingsDto _self;
  final $Res Function(AppSettingsDto) _then;

/// Create a copy of AppSettingsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastSkippedVersion = freezed,}) {
  return _then(_self.copyWith(
lastSkippedVersion: freezed == lastSkippedVersion ? _self.lastSkippedVersion : lastSkippedVersion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AppSettingsDto implements AppSettingsDto {
   _AppSettingsDto({@JsonKey(name: 'last_skipped_version') this.lastSkippedVersion});
  factory _AppSettingsDto.fromJson(Map<String, dynamic> json) => _$AppSettingsDtoFromJson(json);

@override@JsonKey(name: 'last_skipped_version') final  String? lastSkippedVersion;

/// Create a copy of AppSettingsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsDtoCopyWith<_AppSettingsDto> get copyWith => __$AppSettingsDtoCopyWithImpl<_AppSettingsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettingsDto&&(identical(other.lastSkippedVersion, lastSkippedVersion) || other.lastSkippedVersion == lastSkippedVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastSkippedVersion);

@override
String toString() {
  return 'AppSettingsDto(lastSkippedVersion: $lastSkippedVersion)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsDtoCopyWith<$Res> implements $AppSettingsDtoCopyWith<$Res> {
  factory _$AppSettingsDtoCopyWith(_AppSettingsDto value, $Res Function(_AppSettingsDto) _then) = __$AppSettingsDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'last_skipped_version') String? lastSkippedVersion
});




}
/// @nodoc
class __$AppSettingsDtoCopyWithImpl<$Res>
    implements _$AppSettingsDtoCopyWith<$Res> {
  __$AppSettingsDtoCopyWithImpl(this._self, this._then);

  final _AppSettingsDto _self;
  final $Res Function(_AppSettingsDto) _then;

/// Create a copy of AppSettingsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastSkippedVersion = freezed,}) {
  return _then(_AppSettingsDto(
lastSkippedVersion: freezed == lastSkippedVersion ? _self.lastSkippedVersion : lastSkippedVersion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
