// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LearningCategoryDto {

 String get nameDe; String get nameEn; String get descriptionDe; String get descriptionEn; String get iconName; List<LearningCategoryDto>? get subcategories;
/// Create a copy of LearningCategoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningCategoryDtoCopyWith<LearningCategoryDto> get copyWith => _$LearningCategoryDtoCopyWithImpl<LearningCategoryDto>(this as LearningCategoryDto, _$identity);

  /// Serializes this LearningCategoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningCategoryDto&&(identical(other.nameDe, nameDe) || other.nameDe == nameDe)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.descriptionDe, descriptionDe) || other.descriptionDe == descriptionDe)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&const DeepCollectionEquality().equals(other.subcategories, subcategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nameDe,nameEn,descriptionDe,descriptionEn,iconName,const DeepCollectionEquality().hash(subcategories));

@override
String toString() {
  return 'LearningCategoryDto(nameDe: $nameDe, nameEn: $nameEn, descriptionDe: $descriptionDe, descriptionEn: $descriptionEn, iconName: $iconName, subcategories: $subcategories)';
}


}

/// @nodoc
abstract mixin class $LearningCategoryDtoCopyWith<$Res>  {
  factory $LearningCategoryDtoCopyWith(LearningCategoryDto value, $Res Function(LearningCategoryDto) _then) = _$LearningCategoryDtoCopyWithImpl;
@useResult
$Res call({
 String nameDe, String nameEn, String descriptionDe, String descriptionEn, String iconName, List<LearningCategoryDto>? subcategories
});




}
/// @nodoc
class _$LearningCategoryDtoCopyWithImpl<$Res>
    implements $LearningCategoryDtoCopyWith<$Res> {
  _$LearningCategoryDtoCopyWithImpl(this._self, this._then);

  final LearningCategoryDto _self;
  final $Res Function(LearningCategoryDto) _then;

/// Create a copy of LearningCategoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nameDe = null,Object? nameEn = null,Object? descriptionDe = null,Object? descriptionEn = null,Object? iconName = null,Object? subcategories = freezed,}) {
  return _then(_self.copyWith(
nameDe: null == nameDe ? _self.nameDe : nameDe // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,descriptionDe: null == descriptionDe ? _self.descriptionDe : descriptionDe // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: null == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,subcategories: freezed == subcategories ? _self.subcategories : subcategories // ignore: cast_nullable_to_non_nullable
as List<LearningCategoryDto>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LearningCategoryDto implements LearningCategoryDto {
  const _LearningCategoryDto({required this.nameDe, required this.nameEn, required this.descriptionDe, required this.descriptionEn, required this.iconName, final  List<LearningCategoryDto>? subcategories}): _subcategories = subcategories;
  factory _LearningCategoryDto.fromJson(Map<String, dynamic> json) => _$LearningCategoryDtoFromJson(json);

@override final  String nameDe;
@override final  String nameEn;
@override final  String descriptionDe;
@override final  String descriptionEn;
@override final  String iconName;
 final  List<LearningCategoryDto>? _subcategories;
@override List<LearningCategoryDto>? get subcategories {
  final value = _subcategories;
  if (value == null) return null;
  if (_subcategories is EqualUnmodifiableListView) return _subcategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LearningCategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningCategoryDtoCopyWith<_LearningCategoryDto> get copyWith => __$LearningCategoryDtoCopyWithImpl<_LearningCategoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LearningCategoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningCategoryDto&&(identical(other.nameDe, nameDe) || other.nameDe == nameDe)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.descriptionDe, descriptionDe) || other.descriptionDe == descriptionDe)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&const DeepCollectionEquality().equals(other._subcategories, _subcategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nameDe,nameEn,descriptionDe,descriptionEn,iconName,const DeepCollectionEquality().hash(_subcategories));

@override
String toString() {
  return 'LearningCategoryDto(nameDe: $nameDe, nameEn: $nameEn, descriptionDe: $descriptionDe, descriptionEn: $descriptionEn, iconName: $iconName, subcategories: $subcategories)';
}


}

/// @nodoc
abstract mixin class _$LearningCategoryDtoCopyWith<$Res> implements $LearningCategoryDtoCopyWith<$Res> {
  factory _$LearningCategoryDtoCopyWith(_LearningCategoryDto value, $Res Function(_LearningCategoryDto) _then) = __$LearningCategoryDtoCopyWithImpl;
@override @useResult
$Res call({
 String nameDe, String nameEn, String descriptionDe, String descriptionEn, String iconName, List<LearningCategoryDto>? subcategories
});




}
/// @nodoc
class __$LearningCategoryDtoCopyWithImpl<$Res>
    implements _$LearningCategoryDtoCopyWith<$Res> {
  __$LearningCategoryDtoCopyWithImpl(this._self, this._then);

  final _LearningCategoryDto _self;
  final $Res Function(_LearningCategoryDto) _then;

/// Create a copy of LearningCategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nameDe = null,Object? nameEn = null,Object? descriptionDe = null,Object? descriptionEn = null,Object? iconName = null,Object? subcategories = freezed,}) {
  return _then(_LearningCategoryDto(
nameDe: null == nameDe ? _self.nameDe : nameDe // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,descriptionDe: null == descriptionDe ? _self.descriptionDe : descriptionDe // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: null == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,subcategories: freezed == subcategories ? _self._subcategories : subcategories // ignore: cast_nullable_to_non_nullable
as List<LearningCategoryDto>?,
  ));
}


}

// dart format on
