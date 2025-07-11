// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learn_word_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LearnWordEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearnWordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LearnWordEvent()';
}


}

/// @nodoc
class $LearnWordEventCopyWith<$Res>  {
$LearnWordEventCopyWith(LearnWordEvent _, $Res Function(LearnWordEvent) __);
}


/// Adds pattern-matching-related methods to [LearnWordEvent].
extension LearnWordEventPatterns on LearnWordEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initialize value)?  initialize,TResult Function( FetchImageUrl value)?  fetchImageUrl,TResult Function( ChangeWord value)?  changeWord,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initialize() when initialize != null:
return initialize(_that);case FetchImageUrl() when fetchImageUrl != null:
return fetchImageUrl(_that);case ChangeWord() when changeWord != null:
return changeWord(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initialize value)  initialize,required TResult Function( FetchImageUrl value)  fetchImageUrl,required TResult Function( ChangeWord value)  changeWord,}){
final _that = this;
switch (_that) {
case Initialize():
return initialize(_that);case FetchImageUrl():
return fetchImageUrl(_that);case ChangeWord():
return changeWord(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initialize value)?  initialize,TResult? Function( FetchImageUrl value)?  fetchImageUrl,TResult? Function( ChangeWord value)?  changeWord,}){
final _that = this;
switch (_that) {
case Initialize() when initialize != null:
return initialize(_that);case FetchImageUrl() when fetchImageUrl != null:
return fetchImageUrl(_that);case ChangeWord() when changeWord != null:
return changeWord(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String categoryId)?  initialize,TResult Function( String categoryId,  String wordId)?  fetchImageUrl,TResult Function( int newIndex)?  changeWord,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initialize() when initialize != null:
return initialize(_that.categoryId);case FetchImageUrl() when fetchImageUrl != null:
return fetchImageUrl(_that.categoryId,_that.wordId);case ChangeWord() when changeWord != null:
return changeWord(_that.newIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String categoryId)  initialize,required TResult Function( String categoryId,  String wordId)  fetchImageUrl,required TResult Function( int newIndex)  changeWord,}) {final _that = this;
switch (_that) {
case Initialize():
return initialize(_that.categoryId);case FetchImageUrl():
return fetchImageUrl(_that.categoryId,_that.wordId);case ChangeWord():
return changeWord(_that.newIndex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String categoryId)?  initialize,TResult? Function( String categoryId,  String wordId)?  fetchImageUrl,TResult? Function( int newIndex)?  changeWord,}) {final _that = this;
switch (_that) {
case Initialize() when initialize != null:
return initialize(_that.categoryId);case FetchImageUrl() when fetchImageUrl != null:
return fetchImageUrl(_that.categoryId,_that.wordId);case ChangeWord() when changeWord != null:
return changeWord(_that.newIndex);case _:
  return null;

}
}

}

/// @nodoc


class Initialize implements LearnWordEvent {
  const Initialize(this.categoryId);
  

 final  String categoryId;

/// Create a copy of LearnWordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitializeCopyWith<Initialize> get copyWith => _$InitializeCopyWithImpl<Initialize>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initialize&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'LearnWordEvent.initialize(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $InitializeCopyWith<$Res> implements $LearnWordEventCopyWith<$Res> {
  factory $InitializeCopyWith(Initialize value, $Res Function(Initialize) _then) = _$InitializeCopyWithImpl;
@useResult
$Res call({
 String categoryId
});




}
/// @nodoc
class _$InitializeCopyWithImpl<$Res>
    implements $InitializeCopyWith<$Res> {
  _$InitializeCopyWithImpl(this._self, this._then);

  final Initialize _self;
  final $Res Function(Initialize) _then;

/// Create a copy of LearnWordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(Initialize(
null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FetchImageUrl implements LearnWordEvent {
  const FetchImageUrl({required this.categoryId, required this.wordId});
  

 final  String categoryId;
 final  String wordId;

/// Create a copy of LearnWordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchImageUrlCopyWith<FetchImageUrl> get copyWith => _$FetchImageUrlCopyWithImpl<FetchImageUrl>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchImageUrl&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.wordId, wordId) || other.wordId == wordId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,wordId);

@override
String toString() {
  return 'LearnWordEvent.fetchImageUrl(categoryId: $categoryId, wordId: $wordId)';
}


}

/// @nodoc
abstract mixin class $FetchImageUrlCopyWith<$Res> implements $LearnWordEventCopyWith<$Res> {
  factory $FetchImageUrlCopyWith(FetchImageUrl value, $Res Function(FetchImageUrl) _then) = _$FetchImageUrlCopyWithImpl;
@useResult
$Res call({
 String categoryId, String wordId
});




}
/// @nodoc
class _$FetchImageUrlCopyWithImpl<$Res>
    implements $FetchImageUrlCopyWith<$Res> {
  _$FetchImageUrlCopyWithImpl(this._self, this._then);

  final FetchImageUrl _self;
  final $Res Function(FetchImageUrl) _then;

/// Create a copy of LearnWordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? wordId = null,}) {
  return _then(FetchImageUrl(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangeWord implements LearnWordEvent {
  const ChangeWord(this.newIndex);
  

 final  int newIndex;

/// Create a copy of LearnWordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeWordCopyWith<ChangeWord> get copyWith => _$ChangeWordCopyWithImpl<ChangeWord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeWord&&(identical(other.newIndex, newIndex) || other.newIndex == newIndex));
}


@override
int get hashCode => Object.hash(runtimeType,newIndex);

@override
String toString() {
  return 'LearnWordEvent.changeWord(newIndex: $newIndex)';
}


}

/// @nodoc
abstract mixin class $ChangeWordCopyWith<$Res> implements $LearnWordEventCopyWith<$Res> {
  factory $ChangeWordCopyWith(ChangeWord value, $Res Function(ChangeWord) _then) = _$ChangeWordCopyWithImpl;
@useResult
$Res call({
 int newIndex
});




}
/// @nodoc
class _$ChangeWordCopyWithImpl<$Res>
    implements $ChangeWordCopyWith<$Res> {
  _$ChangeWordCopyWithImpl(this._self, this._then);

  final ChangeWord _self;
  final $Res Function(ChangeWord) _then;

/// Create a copy of LearnWordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newIndex = null,}) {
  return _then(ChangeWord(
null == newIndex ? _self.newIndex : newIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
