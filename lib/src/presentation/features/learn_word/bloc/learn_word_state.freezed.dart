// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learn_word_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LearnWordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearnWordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LearnWordState()';
}


}

/// @nodoc
class $LearnWordStateCopyWith<$Res>  {
$LearnWordStateCopyWith(LearnWordState _, $Res Function(LearnWordState) __);
}


/// Adds pattern-matching-related methods to [LearnWordState].
extension LearnWordStatePatterns on LearnWordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( InitialError value)?  initialError,TResult Function( Loaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case InitialError() when initialError != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( InitialError value)  initialError,required TResult Function( Loaded value)  loaded,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case InitialError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( InitialError value)?  initialError,TResult? Function( Loaded value)?  loaded,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case InitialError() when initialError != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  initialError,TResult Function( List<WordEntity> wordList,  int currentWordIndex,  String? currentImageUrl)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case InitialError() when initialError != null:
return initialError(_that.message);case Loaded() when loaded != null:
return loaded(_that.wordList,_that.currentWordIndex,_that.currentImageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  initialError,required TResult Function( List<WordEntity> wordList,  int currentWordIndex,  String? currentImageUrl)  loaded,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case InitialError():
return initialError(_that.message);case Loaded():
return loaded(_that.wordList,_that.currentWordIndex,_that.currentImageUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  initialError,TResult? Function( List<WordEntity> wordList,  int currentWordIndex,  String? currentImageUrl)?  loaded,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case InitialError() when initialError != null:
return initialError(_that.message);case Loaded() when loaded != null:
return loaded(_that.wordList,_that.currentWordIndex,_that.currentImageUrl);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements LearnWordState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LearnWordState.initial()';
}


}




/// @nodoc


class Loading implements LearnWordState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LearnWordState.loading()';
}


}




/// @nodoc


class InitialError implements LearnWordState {
  const InitialError(this.message);
  

 final  String message;

/// Create a copy of LearnWordState
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
  return 'LearnWordState.initialError(message: $message)';
}


}

/// @nodoc
abstract mixin class $InitialErrorCopyWith<$Res> implements $LearnWordStateCopyWith<$Res> {
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

/// Create a copy of LearnWordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InitialError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Loaded implements LearnWordState {
  const Loaded({required final  List<WordEntity> wordList, this.currentWordIndex = 0, this.currentImageUrl}): _wordList = wordList;
  

 final  List<WordEntity> _wordList;
 List<WordEntity> get wordList {
  if (_wordList is EqualUnmodifiableListView) return _wordList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wordList);
}

@JsonKey() final  int currentWordIndex;
 final  String? currentImageUrl;

/// Create a copy of LearnWordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._wordList, _wordList)&&(identical(other.currentWordIndex, currentWordIndex) || other.currentWordIndex == currentWordIndex)&&(identical(other.currentImageUrl, currentImageUrl) || other.currentImageUrl == currentImageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_wordList),currentWordIndex,currentImageUrl);

@override
String toString() {
  return 'LearnWordState.loaded(wordList: $wordList, currentWordIndex: $currentWordIndex, currentImageUrl: $currentImageUrl)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $LearnWordStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<WordEntity> wordList, int currentWordIndex, String? currentImageUrl
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of LearnWordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? wordList = null,Object? currentWordIndex = null,Object? currentImageUrl = freezed,}) {
  return _then(Loaded(
wordList: null == wordList ? _self._wordList : wordList // ignore: cast_nullable_to_non_nullable
as List<WordEntity>,currentWordIndex: null == currentWordIndex ? _self.currentWordIndex : currentWordIndex // ignore: cast_nullable_to_non_nullable
as int,currentImageUrl: freezed == currentImageUrl ? _self.currentImageUrl : currentImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
