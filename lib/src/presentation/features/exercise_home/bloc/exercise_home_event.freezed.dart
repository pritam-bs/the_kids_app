// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExerciseHomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseHomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseHomeEvent()';
}


}

/// @nodoc
class $ExerciseHomeEventCopyWith<$Res>  {
$ExerciseHomeEventCopyWith(ExerciseHomeEvent _, $Res Function(ExerciseHomeEvent) __);
}


/// Adds pattern-matching-related methods to [ExerciseHomeEvent].
extension ExerciseHomeEventPatterns on ExerciseHomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CheckModelStatus value)?  checkModelStatus,TResult Function( DownloadModelRequested value)?  downloadModelRequested,TResult Function( DownloadCancelled value)?  downloadCancelled,TResult Function( DeleteModelRequested value)?  deleteModelRequested,TResult Function( DownloadProgressUpdated value)?  downloadProgressUpdated,TResult Function( DownloadCompleted value)?  downloadCompleted,TResult Function( DownloadFailed value)?  downloadFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CheckModelStatus() when checkModelStatus != null:
return checkModelStatus(_that);case DownloadModelRequested() when downloadModelRequested != null:
return downloadModelRequested(_that);case DownloadCancelled() when downloadCancelled != null:
return downloadCancelled(_that);case DeleteModelRequested() when deleteModelRequested != null:
return deleteModelRequested(_that);case DownloadProgressUpdated() when downloadProgressUpdated != null:
return downloadProgressUpdated(_that);case DownloadCompleted() when downloadCompleted != null:
return downloadCompleted(_that);case DownloadFailed() when downloadFailed != null:
return downloadFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CheckModelStatus value)  checkModelStatus,required TResult Function( DownloadModelRequested value)  downloadModelRequested,required TResult Function( DownloadCancelled value)  downloadCancelled,required TResult Function( DeleteModelRequested value)  deleteModelRequested,required TResult Function( DownloadProgressUpdated value)  downloadProgressUpdated,required TResult Function( DownloadCompleted value)  downloadCompleted,required TResult Function( DownloadFailed value)  downloadFailed,}){
final _that = this;
switch (_that) {
case CheckModelStatus():
return checkModelStatus(_that);case DownloadModelRequested():
return downloadModelRequested(_that);case DownloadCancelled():
return downloadCancelled(_that);case DeleteModelRequested():
return deleteModelRequested(_that);case DownloadProgressUpdated():
return downloadProgressUpdated(_that);case DownloadCompleted():
return downloadCompleted(_that);case DownloadFailed():
return downloadFailed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CheckModelStatus value)?  checkModelStatus,TResult? Function( DownloadModelRequested value)?  downloadModelRequested,TResult? Function( DownloadCancelled value)?  downloadCancelled,TResult? Function( DeleteModelRequested value)?  deleteModelRequested,TResult? Function( DownloadProgressUpdated value)?  downloadProgressUpdated,TResult? Function( DownloadCompleted value)?  downloadCompleted,TResult? Function( DownloadFailed value)?  downloadFailed,}){
final _that = this;
switch (_that) {
case CheckModelStatus() when checkModelStatus != null:
return checkModelStatus(_that);case DownloadModelRequested() when downloadModelRequested != null:
return downloadModelRequested(_that);case DownloadCancelled() when downloadCancelled != null:
return downloadCancelled(_that);case DeleteModelRequested() when deleteModelRequested != null:
return deleteModelRequested(_that);case DownloadProgressUpdated() when downloadProgressUpdated != null:
return downloadProgressUpdated(_that);case DownloadCompleted() when downloadCompleted != null:
return downloadCompleted(_that);case DownloadFailed() when downloadFailed != null:
return downloadFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkModelStatus,TResult Function()?  downloadModelRequested,TResult Function()?  downloadCancelled,TResult Function()?  deleteModelRequested,TResult Function( double progress)?  downloadProgressUpdated,TResult Function()?  downloadCompleted,TResult Function( Object error)?  downloadFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CheckModelStatus() when checkModelStatus != null:
return checkModelStatus();case DownloadModelRequested() when downloadModelRequested != null:
return downloadModelRequested();case DownloadCancelled() when downloadCancelled != null:
return downloadCancelled();case DeleteModelRequested() when deleteModelRequested != null:
return deleteModelRequested();case DownloadProgressUpdated() when downloadProgressUpdated != null:
return downloadProgressUpdated(_that.progress);case DownloadCompleted() when downloadCompleted != null:
return downloadCompleted();case DownloadFailed() when downloadFailed != null:
return downloadFailed(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkModelStatus,required TResult Function()  downloadModelRequested,required TResult Function()  downloadCancelled,required TResult Function()  deleteModelRequested,required TResult Function( double progress)  downloadProgressUpdated,required TResult Function()  downloadCompleted,required TResult Function( Object error)  downloadFailed,}) {final _that = this;
switch (_that) {
case CheckModelStatus():
return checkModelStatus();case DownloadModelRequested():
return downloadModelRequested();case DownloadCancelled():
return downloadCancelled();case DeleteModelRequested():
return deleteModelRequested();case DownloadProgressUpdated():
return downloadProgressUpdated(_that.progress);case DownloadCompleted():
return downloadCompleted();case DownloadFailed():
return downloadFailed(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkModelStatus,TResult? Function()?  downloadModelRequested,TResult? Function()?  downloadCancelled,TResult? Function()?  deleteModelRequested,TResult? Function( double progress)?  downloadProgressUpdated,TResult? Function()?  downloadCompleted,TResult? Function( Object error)?  downloadFailed,}) {final _that = this;
switch (_that) {
case CheckModelStatus() when checkModelStatus != null:
return checkModelStatus();case DownloadModelRequested() when downloadModelRequested != null:
return downloadModelRequested();case DownloadCancelled() when downloadCancelled != null:
return downloadCancelled();case DeleteModelRequested() when deleteModelRequested != null:
return deleteModelRequested();case DownloadProgressUpdated() when downloadProgressUpdated != null:
return downloadProgressUpdated(_that.progress);case DownloadCompleted() when downloadCompleted != null:
return downloadCompleted();case DownloadFailed() when downloadFailed != null:
return downloadFailed(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class CheckModelStatus implements ExerciseHomeEvent {
  const CheckModelStatus();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckModelStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseHomeEvent.checkModelStatus()';
}


}




/// @nodoc


class DownloadModelRequested implements ExerciseHomeEvent {
  const DownloadModelRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadModelRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseHomeEvent.downloadModelRequested()';
}


}




/// @nodoc


class DownloadCancelled implements ExerciseHomeEvent {
  const DownloadCancelled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadCancelled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseHomeEvent.downloadCancelled()';
}


}




/// @nodoc


class DeleteModelRequested implements ExerciseHomeEvent {
  const DeleteModelRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteModelRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseHomeEvent.deleteModelRequested()';
}


}




/// @nodoc


class DownloadProgressUpdated implements ExerciseHomeEvent {
  const DownloadProgressUpdated({required this.progress});
  

 final  double progress;

/// Create a copy of ExerciseHomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadProgressUpdatedCopyWith<DownloadProgressUpdated> get copyWith => _$DownloadProgressUpdatedCopyWithImpl<DownloadProgressUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadProgressUpdated&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString() {
  return 'ExerciseHomeEvent.downloadProgressUpdated(progress: $progress)';
}


}

/// @nodoc
abstract mixin class $DownloadProgressUpdatedCopyWith<$Res> implements $ExerciseHomeEventCopyWith<$Res> {
  factory $DownloadProgressUpdatedCopyWith(DownloadProgressUpdated value, $Res Function(DownloadProgressUpdated) _then) = _$DownloadProgressUpdatedCopyWithImpl;
@useResult
$Res call({
 double progress
});




}
/// @nodoc
class _$DownloadProgressUpdatedCopyWithImpl<$Res>
    implements $DownloadProgressUpdatedCopyWith<$Res> {
  _$DownloadProgressUpdatedCopyWithImpl(this._self, this._then);

  final DownloadProgressUpdated _self;
  final $Res Function(DownloadProgressUpdated) _then;

/// Create a copy of ExerciseHomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(DownloadProgressUpdated(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class DownloadCompleted implements ExerciseHomeEvent {
  const DownloadCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseHomeEvent.downloadCompleted()';
}


}




/// @nodoc


class DownloadFailed implements ExerciseHomeEvent {
  const DownloadFailed({required this.error});
  

 final  Object error;

/// Create a copy of ExerciseHomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadFailedCopyWith<DownloadFailed> get copyWith => _$DownloadFailedCopyWithImpl<DownloadFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadFailed&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ExerciseHomeEvent.downloadFailed(error: $error)';
}


}

/// @nodoc
abstract mixin class $DownloadFailedCopyWith<$Res> implements $ExerciseHomeEventCopyWith<$Res> {
  factory $DownloadFailedCopyWith(DownloadFailed value, $Res Function(DownloadFailed) _then) = _$DownloadFailedCopyWithImpl;
@useResult
$Res call({
 Object error
});




}
/// @nodoc
class _$DownloadFailedCopyWithImpl<$Res>
    implements $DownloadFailedCopyWith<$Res> {
  _$DownloadFailedCopyWithImpl(this._self, this._then);

  final DownloadFailed _self;
  final $Res Function(DownloadFailed) _then;

/// Create a copy of ExerciseHomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DownloadFailed(
error: null == error ? _self.error : error ,
  ));
}


}

// dart format on
