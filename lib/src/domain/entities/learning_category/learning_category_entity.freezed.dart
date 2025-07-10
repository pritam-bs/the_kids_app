// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_category_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LearningCategoryEntity {

 String get nameDe; String get nameEn; String get descriptionDe; String get descriptionEn; String get iconName; List<LearningCategoryEntity> get subcategories;
/// Create a copy of LearningCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningCategoryEntityCopyWith<LearningCategoryEntity> get copyWith => _$LearningCategoryEntityCopyWithImpl<LearningCategoryEntity>(this as LearningCategoryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningCategoryEntity&&(identical(other.nameDe, nameDe) || other.nameDe == nameDe)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.descriptionDe, descriptionDe) || other.descriptionDe == descriptionDe)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&const DeepCollectionEquality().equals(other.subcategories, subcategories));
}


@override
int get hashCode => Object.hash(runtimeType,nameDe,nameEn,descriptionDe,descriptionEn,iconName,const DeepCollectionEquality().hash(subcategories));

@override
String toString() {
  return 'LearningCategoryEntity(nameDe: $nameDe, nameEn: $nameEn, descriptionDe: $descriptionDe, descriptionEn: $descriptionEn, iconName: $iconName, subcategories: $subcategories)';
}


}

/// @nodoc
abstract mixin class $LearningCategoryEntityCopyWith<$Res>  {
  factory $LearningCategoryEntityCopyWith(LearningCategoryEntity value, $Res Function(LearningCategoryEntity) _then) = _$LearningCategoryEntityCopyWithImpl;
@useResult
$Res call({
 String nameDe, String nameEn, String descriptionDe, String descriptionEn, String iconName, List<LearningCategoryEntity> subcategories
});




}
/// @nodoc
class _$LearningCategoryEntityCopyWithImpl<$Res>
    implements $LearningCategoryEntityCopyWith<$Res> {
  _$LearningCategoryEntityCopyWithImpl(this._self, this._then);

  final LearningCategoryEntity _self;
  final $Res Function(LearningCategoryEntity) _then;

/// Create a copy of LearningCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nameDe = null,Object? nameEn = null,Object? descriptionDe = null,Object? descriptionEn = null,Object? iconName = null,Object? subcategories = null,}) {
  return _then(_self.copyWith(
nameDe: null == nameDe ? _self.nameDe : nameDe // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,descriptionDe: null == descriptionDe ? _self.descriptionDe : descriptionDe // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: null == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,subcategories: null == subcategories ? _self.subcategories : subcategories // ignore: cast_nullable_to_non_nullable
as List<LearningCategoryEntity>,
  ));
}

}


/// @nodoc


class _LearningCategoryEntity implements LearningCategoryEntity {
  const _LearningCategoryEntity({required this.nameDe, required this.nameEn, required this.descriptionDe, required this.descriptionEn, required this.iconName, required final  List<LearningCategoryEntity> subcategories}): _subcategories = subcategories;
  

@override final  String nameDe;
@override final  String nameEn;
@override final  String descriptionDe;
@override final  String descriptionEn;
@override final  String iconName;
 final  List<LearningCategoryEntity> _subcategories;
@override List<LearningCategoryEntity> get subcategories {
  if (_subcategories is EqualUnmodifiableListView) return _subcategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subcategories);
}


/// Create a copy of LearningCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningCategoryEntityCopyWith<_LearningCategoryEntity> get copyWith => __$LearningCategoryEntityCopyWithImpl<_LearningCategoryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningCategoryEntity&&(identical(other.nameDe, nameDe) || other.nameDe == nameDe)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.descriptionDe, descriptionDe) || other.descriptionDe == descriptionDe)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&const DeepCollectionEquality().equals(other._subcategories, _subcategories));
}


@override
int get hashCode => Object.hash(runtimeType,nameDe,nameEn,descriptionDe,descriptionEn,iconName,const DeepCollectionEquality().hash(_subcategories));

@override
String toString() {
  return 'LearningCategoryEntity(nameDe: $nameDe, nameEn: $nameEn, descriptionDe: $descriptionDe, descriptionEn: $descriptionEn, iconName: $iconName, subcategories: $subcategories)';
}


}

/// @nodoc
abstract mixin class _$LearningCategoryEntityCopyWith<$Res> implements $LearningCategoryEntityCopyWith<$Res> {
  factory _$LearningCategoryEntityCopyWith(_LearningCategoryEntity value, $Res Function(_LearningCategoryEntity) _then) = __$LearningCategoryEntityCopyWithImpl;
@override @useResult
$Res call({
 String nameDe, String nameEn, String descriptionDe, String descriptionEn, String iconName, List<LearningCategoryEntity> subcategories
});




}
/// @nodoc
class __$LearningCategoryEntityCopyWithImpl<$Res>
    implements _$LearningCategoryEntityCopyWith<$Res> {
  __$LearningCategoryEntityCopyWithImpl(this._self, this._then);

  final _LearningCategoryEntity _self;
  final $Res Function(_LearningCategoryEntity) _then;

/// Create a copy of LearningCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nameDe = null,Object? nameEn = null,Object? descriptionDe = null,Object? descriptionEn = null,Object? iconName = null,Object? subcategories = null,}) {
  return _then(_LearningCategoryEntity(
nameDe: null == nameDe ? _self.nameDe : nameDe // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,descriptionDe: null == descriptionDe ? _self.descriptionDe : descriptionDe // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: null == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,subcategories: null == subcategories ? _self._subcategories : subcategories // ignore: cast_nullable_to_non_nullable
as List<LearningCategoryEntity>,
  ));
}


}

// dart format on
