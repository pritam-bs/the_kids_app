// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [CategorySelectionState].
extension CategorySelectionStatePatterns on CategorySelectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( InitialError value)?  initialError,TResult Function( Loaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case InitialError() when initialError != null:
return initialError(_that);case Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( InitialError value)  initialError,required TResult Function( Loaded value)  loaded,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case InitialError():
return initialError(_that);case Loaded():
return loaded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( InitialError value)?  initialError,TResult? Function( Loaded value)?  loaded,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case InitialError() when initialError != null:
return initialError(_that);case Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String message)?  initialError,TResult Function( List<LearningCategoryEntity> learningCategories)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case InitialError() when initialError != null:
return initialError(_that.message);case Loaded() when loaded != null:
return loaded(_that.learningCategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String message)  initialError,required TResult Function( List<LearningCategoryEntity> learningCategories)  loaded,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case InitialError():
return initialError(_that.message);case Loaded():
return loaded(_that.learningCategories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String message)?  initialError,TResult? Function( List<LearningCategoryEntity> learningCategories)?  loaded,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case InitialError() when initialError != null:
return initialError(_that.message);case Loaded() when loaded != null:
return loaded(_that.learningCategories);case _:
  return null;

}
}

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
