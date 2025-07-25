// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExerciseHomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseHomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseHomeState()';
}


}

/// @nodoc
class $ExerciseHomeStateCopyWith<$Res>  {
$ExerciseHomeStateCopyWith(ExerciseHomeState _, $Res Function(ExerciseHomeState) __);
}


/// Adds pattern-matching-related methods to [ExerciseHomeState].
extension ExerciseHomeStatePatterns on ExerciseHomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( ModelInfoReady value)?  modelInfoReady,TResult Function( Downloading value)?  downloading,TResult Function( Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case ModelInfoReady() when modelInfoReady != null:
return modelInfoReady(_that);case Downloading() when downloading != null:
return downloading(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( ModelInfoReady value)  modelInfoReady,required TResult Function( Downloading value)  downloading,required TResult Function( Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case ModelInfoReady():
return modelInfoReady(_that);case Downloading():
return downloading(_that);case Failure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( ModelInfoReady value)?  modelInfoReady,TResult? Function( Downloading value)?  downloading,TResult? Function( Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case ModelInfoReady() when modelInfoReady != null:
return modelInfoReady(_that);case Downloading() when downloading != null:
return downloading(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ModelInfoEntity modelInfo)?  modelInfoReady,TResult Function( double progress)?  downloading,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case ModelInfoReady() when modelInfoReady != null:
return modelInfoReady(_that.modelInfo);case Downloading() when downloading != null:
return downloading(_that.progress);case Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ModelInfoEntity modelInfo)  modelInfoReady,required TResult Function( double progress)  downloading,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case ModelInfoReady():
return modelInfoReady(_that.modelInfo);case Downloading():
return downloading(_that.progress);case Failure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ModelInfoEntity modelInfo)?  modelInfoReady,TResult? Function( double progress)?  downloading,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case ModelInfoReady() when modelInfoReady != null:
return modelInfoReady(_that.modelInfo);case Downloading() when downloading != null:
return downloading(_that.progress);case Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ExerciseHomeState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseHomeState.initial()';
}


}




/// @nodoc


class _Loading implements ExerciseHomeState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseHomeState.loading()';
}


}




/// @nodoc


class ModelInfoReady implements ExerciseHomeState {
  const ModelInfoReady({required this.modelInfo});
  

 final  ModelInfoEntity modelInfo;

/// Create a copy of ExerciseHomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelInfoReadyCopyWith<ModelInfoReady> get copyWith => _$ModelInfoReadyCopyWithImpl<ModelInfoReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelInfoReady&&(identical(other.modelInfo, modelInfo) || other.modelInfo == modelInfo));
}


@override
int get hashCode => Object.hash(runtimeType,modelInfo);

@override
String toString() {
  return 'ExerciseHomeState.modelInfoReady(modelInfo: $modelInfo)';
}


}

/// @nodoc
abstract mixin class $ModelInfoReadyCopyWith<$Res> implements $ExerciseHomeStateCopyWith<$Res> {
  factory $ModelInfoReadyCopyWith(ModelInfoReady value, $Res Function(ModelInfoReady) _then) = _$ModelInfoReadyCopyWithImpl;
@useResult
$Res call({
 ModelInfoEntity modelInfo
});


$ModelInfoEntityCopyWith<$Res> get modelInfo;

}
/// @nodoc
class _$ModelInfoReadyCopyWithImpl<$Res>
    implements $ModelInfoReadyCopyWith<$Res> {
  _$ModelInfoReadyCopyWithImpl(this._self, this._then);

  final ModelInfoReady _self;
  final $Res Function(ModelInfoReady) _then;

/// Create a copy of ExerciseHomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? modelInfo = null,}) {
  return _then(ModelInfoReady(
modelInfo: null == modelInfo ? _self.modelInfo : modelInfo // ignore: cast_nullable_to_non_nullable
as ModelInfoEntity,
  ));
}

/// Create a copy of ExerciseHomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelInfoEntityCopyWith<$Res> get modelInfo {
  
  return $ModelInfoEntityCopyWith<$Res>(_self.modelInfo, (value) {
    return _then(_self.copyWith(modelInfo: value));
  });
}
}

/// @nodoc


class Downloading implements ExerciseHomeState {
  const Downloading({required this.progress});
  

 final  double progress;

/// Create a copy of ExerciseHomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadingCopyWith<Downloading> get copyWith => _$DownloadingCopyWithImpl<Downloading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Downloading&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString() {
  return 'ExerciseHomeState.downloading(progress: $progress)';
}


}

/// @nodoc
abstract mixin class $DownloadingCopyWith<$Res> implements $ExerciseHomeStateCopyWith<$Res> {
  factory $DownloadingCopyWith(Downloading value, $Res Function(Downloading) _then) = _$DownloadingCopyWithImpl;
@useResult
$Res call({
 double progress
});




}
/// @nodoc
class _$DownloadingCopyWithImpl<$Res>
    implements $DownloadingCopyWith<$Res> {
  _$DownloadingCopyWithImpl(this._self, this._then);

  final Downloading _self;
  final $Res Function(Downloading) _then;

/// Create a copy of ExerciseHomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(Downloading(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class Failure implements ExerciseHomeState {
  const Failure({required this.message});
  

 final  String message;

/// Create a copy of ExerciseHomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ExerciseHomeState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> implements $ExerciseHomeStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of ExerciseHomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
