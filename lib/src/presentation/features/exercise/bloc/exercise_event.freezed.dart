// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExerciseEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseEvent()';
}


}

/// @nodoc
class $ExerciseEventCopyWith<$Res>  {
$ExerciseEventCopyWith(ExerciseEvent _, $Res Function(ExerciseEvent) __);
}


/// Adds pattern-matching-related methods to [ExerciseEvent].
extension ExerciseEventPatterns on ExerciseEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitializeExercises value)?  initializeExercises,TResult Function( ChangeExercise value)?  changeExercise,TResult Function( ExerciseAnswered value)?  exerciseAnswered,TResult Function( ClearAnswerFeedback value)?  clearAnswerFeedback,TResult Function( ShowResult value)?  showResult,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitializeExercises() when initializeExercises != null:
return initializeExercises(_that);case ChangeExercise() when changeExercise != null:
return changeExercise(_that);case ExerciseAnswered() when exerciseAnswered != null:
return exerciseAnswered(_that);case ClearAnswerFeedback() when clearAnswerFeedback != null:
return clearAnswerFeedback(_that);case ShowResult() when showResult != null:
return showResult(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitializeExercises value)  initializeExercises,required TResult Function( ChangeExercise value)  changeExercise,required TResult Function( ExerciseAnswered value)  exerciseAnswered,required TResult Function( ClearAnswerFeedback value)  clearAnswerFeedback,required TResult Function( ShowResult value)  showResult,}){
final _that = this;
switch (_that) {
case InitializeExercises():
return initializeExercises(_that);case ChangeExercise():
return changeExercise(_that);case ExerciseAnswered():
return exerciseAnswered(_that);case ClearAnswerFeedback():
return clearAnswerFeedback(_that);case ShowResult():
return showResult(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitializeExercises value)?  initializeExercises,TResult? Function( ChangeExercise value)?  changeExercise,TResult? Function( ExerciseAnswered value)?  exerciseAnswered,TResult? Function( ClearAnswerFeedback value)?  clearAnswerFeedback,TResult? Function( ShowResult value)?  showResult,}){
final _that = this;
switch (_that) {
case InitializeExercises() when initializeExercises != null:
return initializeExercises(_that);case ChangeExercise() when changeExercise != null:
return changeExercise(_that);case ExerciseAnswered() when exerciseAnswered != null:
return exerciseAnswered(_that);case ClearAnswerFeedback() when clearAnswerFeedback != null:
return clearAnswerFeedback(_that);case ShowResult() when showResult != null:
return showResult(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ExerciseType exerciseType)?  initializeExercises,TResult Function( int newIndex)?  changeExercise,TResult Function( bool isCorrect,  ExerciseType exerciseType)?  exerciseAnswered,TResult Function()?  clearAnswerFeedback,TResult Function()?  showResult,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitializeExercises() when initializeExercises != null:
return initializeExercises(_that.exerciseType);case ChangeExercise() when changeExercise != null:
return changeExercise(_that.newIndex);case ExerciseAnswered() when exerciseAnswered != null:
return exerciseAnswered(_that.isCorrect,_that.exerciseType);case ClearAnswerFeedback() when clearAnswerFeedback != null:
return clearAnswerFeedback();case ShowResult() when showResult != null:
return showResult();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ExerciseType exerciseType)  initializeExercises,required TResult Function( int newIndex)  changeExercise,required TResult Function( bool isCorrect,  ExerciseType exerciseType)  exerciseAnswered,required TResult Function()  clearAnswerFeedback,required TResult Function()  showResult,}) {final _that = this;
switch (_that) {
case InitializeExercises():
return initializeExercises(_that.exerciseType);case ChangeExercise():
return changeExercise(_that.newIndex);case ExerciseAnswered():
return exerciseAnswered(_that.isCorrect,_that.exerciseType);case ClearAnswerFeedback():
return clearAnswerFeedback();case ShowResult():
return showResult();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ExerciseType exerciseType)?  initializeExercises,TResult? Function( int newIndex)?  changeExercise,TResult? Function( bool isCorrect,  ExerciseType exerciseType)?  exerciseAnswered,TResult? Function()?  clearAnswerFeedback,TResult? Function()?  showResult,}) {final _that = this;
switch (_that) {
case InitializeExercises() when initializeExercises != null:
return initializeExercises(_that.exerciseType);case ChangeExercise() when changeExercise != null:
return changeExercise(_that.newIndex);case ExerciseAnswered() when exerciseAnswered != null:
return exerciseAnswered(_that.isCorrect,_that.exerciseType);case ClearAnswerFeedback() when clearAnswerFeedback != null:
return clearAnswerFeedback();case ShowResult() when showResult != null:
return showResult();case _:
  return null;

}
}

}

/// @nodoc


class InitializeExercises implements ExerciseEvent {
  const InitializeExercises({required this.exerciseType});
  

 final  ExerciseType exerciseType;

/// Create a copy of ExerciseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitializeExercisesCopyWith<InitializeExercises> get copyWith => _$InitializeExercisesCopyWithImpl<InitializeExercises>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitializeExercises&&(identical(other.exerciseType, exerciseType) || other.exerciseType == exerciseType));
}


@override
int get hashCode => Object.hash(runtimeType,exerciseType);

@override
String toString() {
  return 'ExerciseEvent.initializeExercises(exerciseType: $exerciseType)';
}


}

/// @nodoc
abstract mixin class $InitializeExercisesCopyWith<$Res> implements $ExerciseEventCopyWith<$Res> {
  factory $InitializeExercisesCopyWith(InitializeExercises value, $Res Function(InitializeExercises) _then) = _$InitializeExercisesCopyWithImpl;
@useResult
$Res call({
 ExerciseType exerciseType
});




}
/// @nodoc
class _$InitializeExercisesCopyWithImpl<$Res>
    implements $InitializeExercisesCopyWith<$Res> {
  _$InitializeExercisesCopyWithImpl(this._self, this._then);

  final InitializeExercises _self;
  final $Res Function(InitializeExercises) _then;

/// Create a copy of ExerciseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exerciseType = null,}) {
  return _then(InitializeExercises(
exerciseType: null == exerciseType ? _self.exerciseType : exerciseType // ignore: cast_nullable_to_non_nullable
as ExerciseType,
  ));
}


}

/// @nodoc


class ChangeExercise implements ExerciseEvent {
  const ChangeExercise(this.newIndex);
  

 final  int newIndex;

/// Create a copy of ExerciseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeExerciseCopyWith<ChangeExercise> get copyWith => _$ChangeExerciseCopyWithImpl<ChangeExercise>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeExercise&&(identical(other.newIndex, newIndex) || other.newIndex == newIndex));
}


@override
int get hashCode => Object.hash(runtimeType,newIndex);

@override
String toString() {
  return 'ExerciseEvent.changeExercise(newIndex: $newIndex)';
}


}

/// @nodoc
abstract mixin class $ChangeExerciseCopyWith<$Res> implements $ExerciseEventCopyWith<$Res> {
  factory $ChangeExerciseCopyWith(ChangeExercise value, $Res Function(ChangeExercise) _then) = _$ChangeExerciseCopyWithImpl;
@useResult
$Res call({
 int newIndex
});




}
/// @nodoc
class _$ChangeExerciseCopyWithImpl<$Res>
    implements $ChangeExerciseCopyWith<$Res> {
  _$ChangeExerciseCopyWithImpl(this._self, this._then);

  final ChangeExercise _self;
  final $Res Function(ChangeExercise) _then;

/// Create a copy of ExerciseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newIndex = null,}) {
  return _then(ChangeExercise(
null == newIndex ? _self.newIndex : newIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ExerciseAnswered implements ExerciseEvent {
  const ExerciseAnswered({required this.isCorrect, required this.exerciseType});
  

 final  bool isCorrect;
 final  ExerciseType exerciseType;

/// Create a copy of ExerciseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseAnsweredCopyWith<ExerciseAnswered> get copyWith => _$ExerciseAnsweredCopyWithImpl<ExerciseAnswered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseAnswered&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.exerciseType, exerciseType) || other.exerciseType == exerciseType));
}


@override
int get hashCode => Object.hash(runtimeType,isCorrect,exerciseType);

@override
String toString() {
  return 'ExerciseEvent.exerciseAnswered(isCorrect: $isCorrect, exerciseType: $exerciseType)';
}


}

/// @nodoc
abstract mixin class $ExerciseAnsweredCopyWith<$Res> implements $ExerciseEventCopyWith<$Res> {
  factory $ExerciseAnsweredCopyWith(ExerciseAnswered value, $Res Function(ExerciseAnswered) _then) = _$ExerciseAnsweredCopyWithImpl;
@useResult
$Res call({
 bool isCorrect, ExerciseType exerciseType
});




}
/// @nodoc
class _$ExerciseAnsweredCopyWithImpl<$Res>
    implements $ExerciseAnsweredCopyWith<$Res> {
  _$ExerciseAnsweredCopyWithImpl(this._self, this._then);

  final ExerciseAnswered _self;
  final $Res Function(ExerciseAnswered) _then;

/// Create a copy of ExerciseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isCorrect = null,Object? exerciseType = null,}) {
  return _then(ExerciseAnswered(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,exerciseType: null == exerciseType ? _self.exerciseType : exerciseType // ignore: cast_nullable_to_non_nullable
as ExerciseType,
  ));
}


}

/// @nodoc


class ClearAnswerFeedback implements ExerciseEvent {
  const ClearAnswerFeedback();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearAnswerFeedback);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseEvent.clearAnswerFeedback()';
}


}




/// @nodoc


class ShowResult implements ExerciseEvent {
  const ShowResult();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseEvent.showResult()';
}


}




// dart format on
