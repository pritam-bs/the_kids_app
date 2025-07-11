// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_check_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppUpdateCheckEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUpdateCheckEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUpdateCheckEvent()';
}


}

/// @nodoc
class $AppUpdateCheckEventCopyWith<$Res>  {
$AppUpdateCheckEventCopyWith(AppUpdateCheckEvent _, $Res Function(AppUpdateCheckEvent) __);
}


/// Adds pattern-matching-related methods to [AppUpdateCheckEvent].
extension AppUpdateCheckEventPatterns on AppUpdateCheckEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initialize value)?  initialize,TResult Function( CheckForUpdate value)?  checkForUpdate,TResult Function( SkipCheckForUpdate value)?  skipCheckForUpdate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initialize() when initialize != null:
return initialize(_that);case CheckForUpdate() when checkForUpdate != null:
return checkForUpdate(_that);case SkipCheckForUpdate() when skipCheckForUpdate != null:
return skipCheckForUpdate(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initialize value)  initialize,required TResult Function( CheckForUpdate value)  checkForUpdate,required TResult Function( SkipCheckForUpdate value)  skipCheckForUpdate,}){
final _that = this;
switch (_that) {
case Initialize():
return initialize(_that);case CheckForUpdate():
return checkForUpdate(_that);case SkipCheckForUpdate():
return skipCheckForUpdate(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initialize value)?  initialize,TResult? Function( CheckForUpdate value)?  checkForUpdate,TResult? Function( SkipCheckForUpdate value)?  skipCheckForUpdate,}){
final _that = this;
switch (_that) {
case Initialize() when initialize != null:
return initialize(_that);case CheckForUpdate() when checkForUpdate != null:
return checkForUpdate(_that);case SkipCheckForUpdate() when skipCheckForUpdate != null:
return skipCheckForUpdate(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function()?  checkForUpdate,TResult Function()?  skipCheckForUpdate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initialize() when initialize != null:
return initialize();case CheckForUpdate() when checkForUpdate != null:
return checkForUpdate();case SkipCheckForUpdate() when skipCheckForUpdate != null:
return skipCheckForUpdate();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function()  checkForUpdate,required TResult Function()  skipCheckForUpdate,}) {final _that = this;
switch (_that) {
case Initialize():
return initialize();case CheckForUpdate():
return checkForUpdate();case SkipCheckForUpdate():
return skipCheckForUpdate();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function()?  checkForUpdate,TResult? Function()?  skipCheckForUpdate,}) {final _that = this;
switch (_that) {
case Initialize() when initialize != null:
return initialize();case CheckForUpdate() when checkForUpdate != null:
return checkForUpdate();case SkipCheckForUpdate() when skipCheckForUpdate != null:
return skipCheckForUpdate();case _:
  return null;

}
}

}

/// @nodoc


class Initialize implements AppUpdateCheckEvent {
  const Initialize();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initialize);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUpdateCheckEvent.initialize()';
}


}




/// @nodoc


class CheckForUpdate implements AppUpdateCheckEvent {
  const CheckForUpdate();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckForUpdate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUpdateCheckEvent.checkForUpdate()';
}


}




/// @nodoc


class SkipCheckForUpdate implements AppUpdateCheckEvent {
  const SkipCheckForUpdate();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkipCheckForUpdate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUpdateCheckEvent.skipCheckForUpdate()';
}


}




// dart format on
