// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learned_word_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LearnedWordEntity {

 int? get id; String get word; String get category; int get seenCount; int get exerciseCount;
/// Create a copy of LearnedWordEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearnedWordEntityCopyWith<LearnedWordEntity> get copyWith => _$LearnedWordEntityCopyWithImpl<LearnedWordEntity>(this as LearnedWordEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearnedWordEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.category, category) || other.category == category)&&(identical(other.seenCount, seenCount) || other.seenCount == seenCount)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,word,category,seenCount,exerciseCount);

@override
String toString() {
  return 'LearnedWordEntity(id: $id, word: $word, category: $category, seenCount: $seenCount, exerciseCount: $exerciseCount)';
}


}

/// @nodoc
abstract mixin class $LearnedWordEntityCopyWith<$Res>  {
  factory $LearnedWordEntityCopyWith(LearnedWordEntity value, $Res Function(LearnedWordEntity) _then) = _$LearnedWordEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String word, String category, int seenCount, int exerciseCount
});




}
/// @nodoc
class _$LearnedWordEntityCopyWithImpl<$Res>
    implements $LearnedWordEntityCopyWith<$Res> {
  _$LearnedWordEntityCopyWithImpl(this._self, this._then);

  final LearnedWordEntity _self;
  final $Res Function(LearnedWordEntity) _then;

/// Create a copy of LearnedWordEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? word = null,Object? category = null,Object? seenCount = null,Object? exerciseCount = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,seenCount: null == seenCount ? _self.seenCount : seenCount // ignore: cast_nullable_to_non_nullable
as int,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LearnedWordEntity].
extension LearnedWordEntityPatterns on LearnedWordEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearnedWordEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearnedWordEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearnedWordEntity value)  $default,){
final _that = this;
switch (_that) {
case _LearnedWordEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearnedWordEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LearnedWordEntity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String word,  String category,  int seenCount,  int exerciseCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearnedWordEntity() when $default != null:
return $default(_that.id,_that.word,_that.category,_that.seenCount,_that.exerciseCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String word,  String category,  int seenCount,  int exerciseCount)  $default,) {final _that = this;
switch (_that) {
case _LearnedWordEntity():
return $default(_that.id,_that.word,_that.category,_that.seenCount,_that.exerciseCount);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String word,  String category,  int seenCount,  int exerciseCount)?  $default,) {final _that = this;
switch (_that) {
case _LearnedWordEntity() when $default != null:
return $default(_that.id,_that.word,_that.category,_that.seenCount,_that.exerciseCount);case _:
  return null;

}
}

}

/// @nodoc


class _LearnedWordEntity implements LearnedWordEntity {
  const _LearnedWordEntity({this.id, required this.word, required this.category, this.seenCount = 0, this.exerciseCount = 0});
  

@override final  int? id;
@override final  String word;
@override final  String category;
@override@JsonKey() final  int seenCount;
@override@JsonKey() final  int exerciseCount;

/// Create a copy of LearnedWordEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearnedWordEntityCopyWith<_LearnedWordEntity> get copyWith => __$LearnedWordEntityCopyWithImpl<_LearnedWordEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearnedWordEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.category, category) || other.category == category)&&(identical(other.seenCount, seenCount) || other.seenCount == seenCount)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,word,category,seenCount,exerciseCount);

@override
String toString() {
  return 'LearnedWordEntity(id: $id, word: $word, category: $category, seenCount: $seenCount, exerciseCount: $exerciseCount)';
}


}

/// @nodoc
abstract mixin class _$LearnedWordEntityCopyWith<$Res> implements $LearnedWordEntityCopyWith<$Res> {
  factory _$LearnedWordEntityCopyWith(_LearnedWordEntity value, $Res Function(_LearnedWordEntity) _then) = __$LearnedWordEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String word, String category, int seenCount, int exerciseCount
});




}
/// @nodoc
class __$LearnedWordEntityCopyWithImpl<$Res>
    implements _$LearnedWordEntityCopyWith<$Res> {
  __$LearnedWordEntityCopyWithImpl(this._self, this._then);

  final _LearnedWordEntity _self;
  final $Res Function(_LearnedWordEntity) _then;

/// Create a copy of LearnedWordEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? word = null,Object? category = null,Object? seenCount = null,Object? exerciseCount = null,}) {
  return _then(_LearnedWordEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,seenCount: null == seenCount ? _self.seenCount : seenCount // ignore: cast_nullable_to_non_nullable
as int,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
