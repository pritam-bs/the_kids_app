// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categoty_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategorySelectionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategorySelectionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategorySelectionState()';
}


}

/// @nodoc
class $CategorySelectionStateCopyWith<$Res>  {
$CategorySelectionStateCopyWith(CategorySelectionState _, $Res Function(CategorySelectionState) __);
}


/// @nodoc


class Initial implements CategorySelectionState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategorySelectionState.initial()';
}


}




/// @nodoc


class InitialError implements CategorySelectionState {
  const InitialError(this.message);
  

 final  String message;

/// Create a copy of CategorySelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialErrorCopyWith<InitialError> get copyWith => _$InitialErrorCopyWithImpl<InitialError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CategorySelectionState.initialError(message: $message)';
}


}

/// @nodoc
abstract mixin class $InitialErrorCopyWith<$Res> implements $CategorySelectionStateCopyWith<$Res> {
  factory $InitialErrorCopyWith(InitialError value, $Res Function(InitialError) _then) = _$InitialErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InitialErrorCopyWithImpl<$Res>
    implements $InitialErrorCopyWith<$Res> {
  _$InitialErrorCopyWithImpl(this._self, this._then);

  final InitialError _self;
  final $Res Function(InitialError) _then;

/// Create a copy of CategorySelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InitialError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Loaded implements CategorySelectionState {
  const Loaded({required final  List<LearningCategoryEntity> learningCategories}): _learningCategories = learningCategories;
  

 final  List<LearningCategoryEntity> _learningCategories;
 List<LearningCategoryEntity> get learningCategories {
  if (_learningCategories is EqualUnmodifiableListView) return _learningCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_learningCategories);
}


/// Create a copy of CategorySelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._learningCategories, _learningCategories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_learningCategories));

@override
String toString() {
  return 'CategorySelectionState.loaded(learningCategories: $learningCategories)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $CategorySelectionStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<LearningCategoryEntity> learningCategories
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of CategorySelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? learningCategories = null,}) {
  return _then(Loaded(
learningCategories: null == learningCategories ? _self._learningCategories : learningCategories // ignore: cast_nullable_to_non_nullable
as List<LearningCategoryEntity>,
  ));
}


}

// dart format on
