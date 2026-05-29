// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RadioPlayerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadioPlayerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RadioPlayerState()';
}


}

/// @nodoc
class $RadioPlayerStateCopyWith<$Res>  {
$RadioPlayerStateCopyWith(RadioPlayerState _, $Res Function(RadioPlayerState) __);
}


/// Adds pattern-matching-related methods to [RadioPlayerState].
extension RadioPlayerStatePatterns on RadioPlayerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _$Initial value)?  initial,TResult Function( _$Loading value)?  loading,TResult Function( _$Error value)?  error,TResult Function( _$Loaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _$Initial() when initial != null:
return initial(_that);case _$Loading() when loading != null:
return loading(_that);case _$Error() when error != null:
return error(_that);case _$Loaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _$Initial value)  initial,required TResult Function( _$Loading value)  loading,required TResult Function( _$Error value)  error,required TResult Function( _$Loaded value)  loaded,}){
final _that = this;
switch (_that) {
case _$Initial():
return initial(_that);case _$Loading():
return loading(_that);case _$Error():
return error(_that);case _$Loaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _$Initial value)?  initial,TResult? Function( _$Loading value)?  loading,TResult? Function( _$Error value)?  error,TResult? Function( _$Loaded value)?  loaded,}){
final _that = this;
switch (_that) {
case _$Initial() when initial != null:
return initial(_that);case _$Loading() when loading != null:
return loading(_that);case _$Error() when error != null:
return error(_that);case _$Loaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  error,TResult Function()?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _$Initial() when initial != null:
return initial();case _$Loading() when loading != null:
return loading();case _$Error() when error != null:
return error(_that.message);case _$Loaded() when loaded != null:
return loaded();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function()  loaded,}) {final _that = this;
switch (_that) {
case _$Initial():
return initial();case _$Loading():
return loading();case _$Error():
return error(_that.message);case _$Loaded():
return loaded();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function()?  loaded,}) {final _that = this;
switch (_that) {
case _$Initial() when initial != null:
return initial();case _$Loading() when loading != null:
return loading();case _$Error() when error != null:
return error(_that.message);case _$Loaded() when loaded != null:
return loaded();case _:
  return null;

}
}

}

/// @nodoc


class _$Initial implements RadioPlayerState {
  const _$Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RadioPlayerState.initial()';
}


}




/// @nodoc


class _$Loading implements RadioPlayerState {
  const _$Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RadioPlayerState.loading()';
}


}




/// @nodoc


class _$Error implements RadioPlayerState {
  const _$Error(this.message);
  

 final  String message;

/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$ErrorCopyWith<_$Error> get copyWith => __$$ErrorCopyWithImpl<_$Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RadioPlayerState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$$ErrorCopyWith<$Res> implements $RadioPlayerStateCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) _then) = __$$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(this._self, this._then);

  final _$Error _self;
  final $Res Function(_$Error) _then;

/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_$Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _$Loaded implements RadioPlayerState {
  const _$Loaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$Loaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RadioPlayerState.loaded()';
}


}




// dart format on
