// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _$ServerFailure value)?  serverError,TResult Function( _$NoInternetFailure value)?  noInternet,TResult Function( _$UnknownFailure value)?  unknown,TResult Function( _$AppFailure value)?  core,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _$ServerFailure() when serverError != null:
return serverError(_that);case _$NoInternetFailure() when noInternet != null:
return noInternet(_that);case _$UnknownFailure() when unknown != null:
return unknown(_that);case _$AppFailure() when core != null:
return core(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _$ServerFailure value)  serverError,required TResult Function( _$NoInternetFailure value)  noInternet,required TResult Function( _$UnknownFailure value)  unknown,required TResult Function( _$AppFailure value)  core,}){
final _that = this;
switch (_that) {
case _$ServerFailure():
return serverError(_that);case _$NoInternetFailure():
return noInternet(_that);case _$UnknownFailure():
return unknown(_that);case _$AppFailure():
return core(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _$ServerFailure value)?  serverError,TResult? Function( _$NoInternetFailure value)?  noInternet,TResult? Function( _$UnknownFailure value)?  unknown,TResult? Function( _$AppFailure value)?  core,}){
final _that = this;
switch (_that) {
case _$ServerFailure() when serverError != null:
return serverError(_that);case _$NoInternetFailure() when noInternet != null:
return noInternet(_that);case _$UnknownFailure() when unknown != null:
return unknown(_that);case _$AppFailure() when core != null:
return core(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  serverError,TResult Function()?  noInternet,TResult Function()?  unknown,TResult Function( String? message)?  core,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _$ServerFailure() when serverError != null:
return serverError(_that.message);case _$NoInternetFailure() when noInternet != null:
return noInternet();case _$UnknownFailure() when unknown != null:
return unknown();case _$AppFailure() when core != null:
return core(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  serverError,required TResult Function()  noInternet,required TResult Function()  unknown,required TResult Function( String? message)  core,}) {final _that = this;
switch (_that) {
case _$ServerFailure():
return serverError(_that.message);case _$NoInternetFailure():
return noInternet();case _$UnknownFailure():
return unknown();case _$AppFailure():
return core(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  serverError,TResult? Function()?  noInternet,TResult? Function()?  unknown,TResult? Function( String? message)?  core,}) {final _that = this;
switch (_that) {
case _$ServerFailure() when serverError != null:
return serverError(_that.message);case _$NoInternetFailure() when noInternet != null:
return noInternet();case _$UnknownFailure() when unknown != null:
return unknown();case _$AppFailure() when core != null:
return core(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _$ServerFailure implements Failure {
  const _$ServerFailure(this.message);
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$ServerFailureCopyWith<_$ServerFailure> get copyWith => __$$ServerFailureCopyWithImpl<_$ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ServerFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$$ServerFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$ServerFailureCopyWith(_$ServerFailure value, $Res Function(_$ServerFailure) _then) = __$$ServerFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$$ServerFailureCopyWithImpl<$Res>
    implements _$$ServerFailureCopyWith<$Res> {
  __$$ServerFailureCopyWithImpl(this._self, this._then);

  final _$ServerFailure _self;
  final $Res Function(_$ServerFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_$ServerFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _$NoInternetFailure implements Failure {
  const _$NoInternetFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$NoInternetFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.noInternet()';
}


}




/// @nodoc


class _$UnknownFailure implements Failure {
  const _$UnknownFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$UnknownFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.unknown()';
}


}




/// @nodoc


class _$AppFailure implements Failure {
  const _$AppFailure(this.message);
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$AppFailureCopyWith<_$AppFailure> get copyWith => __$$AppFailureCopyWithImpl<_$AppFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$AppFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.core(message: $message)';
}


}

/// @nodoc
abstract mixin class _$$AppFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$AppFailureCopyWith(_$AppFailure value, $Res Function(_$AppFailure) _then) = __$$AppFailureCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$$AppFailureCopyWithImpl<$Res>
    implements _$$AppFailureCopyWith<$Res> {
  __$$AppFailureCopyWithImpl(this._self, this._then);

  final _$AppFailure _self;
  final $Res Function(_$AppFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_$AppFailure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
