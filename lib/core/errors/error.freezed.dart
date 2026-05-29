// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppExceptions {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppExceptions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppExceptions()';
}


}

/// @nodoc
class $AppExceptionsCopyWith<$Res>  {
$AppExceptionsCopyWith(AppExceptions _, $Res Function(AppExceptions) __);
}


/// Adds pattern-matching-related methods to [AppExceptions].
extension AppExceptionsPatterns on AppExceptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerException value)?  server,TResult Function( NoInternetException value)?  noInternet,TResult Function( CoreException value)?  core,TResult Function( UnknownException value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerException() when server != null:
return server(_that);case NoInternetException() when noInternet != null:
return noInternet(_that);case CoreException() when core != null:
return core(_that);case UnknownException() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerException value)  server,required TResult Function( NoInternetException value)  noInternet,required TResult Function( CoreException value)  core,required TResult Function( UnknownException value)  unknown,}){
final _that = this;
switch (_that) {
case ServerException():
return server(_that);case NoInternetException():
return noInternet(_that);case CoreException():
return core(_that);case UnknownException():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerException value)?  server,TResult? Function( NoInternetException value)?  noInternet,TResult? Function( CoreException value)?  core,TResult? Function( UnknownException value)?  unknown,}){
final _that = this;
switch (_that) {
case ServerException() when server != null:
return server(_that);case NoInternetException() when noInternet != null:
return noInternet(_that);case CoreException() when core != null:
return core(_that);case UnknownException() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  server,TResult Function()?  noInternet,TResult Function( String? message)?  core,TResult Function()?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerException() when server != null:
return server(_that.message);case NoInternetException() when noInternet != null:
return noInternet();case CoreException() when core != null:
return core(_that.message);case UnknownException() when unknown != null:
return unknown();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  server,required TResult Function()  noInternet,required TResult Function( String? message)  core,required TResult Function()  unknown,}) {final _that = this;
switch (_that) {
case ServerException():
return server(_that.message);case NoInternetException():
return noInternet();case CoreException():
return core(_that.message);case UnknownException():
return unknown();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  server,TResult? Function()?  noInternet,TResult? Function( String? message)?  core,TResult? Function()?  unknown,}) {final _that = this;
switch (_that) {
case ServerException() when server != null:
return server(_that.message);case NoInternetException() when noInternet != null:
return noInternet();case CoreException() when core != null:
return core(_that.message);case UnknownException() when unknown != null:
return unknown();case _:
  return null;

}
}

}

/// @nodoc


class ServerException implements AppExceptions {
  const ServerException(this.message);
  

 final  String message;

/// Create a copy of AppExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerExceptionCopyWith<ServerException> get copyWith => _$ServerExceptionCopyWithImpl<ServerException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppExceptions.server(message: $message)';
}


}

/// @nodoc
abstract mixin class $ServerExceptionCopyWith<$Res> implements $AppExceptionsCopyWith<$Res> {
  factory $ServerExceptionCopyWith(ServerException value, $Res Function(ServerException) _then) = _$ServerExceptionCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ServerExceptionCopyWithImpl<$Res>
    implements $ServerExceptionCopyWith<$Res> {
  _$ServerExceptionCopyWithImpl(this._self, this._then);

  final ServerException _self;
  final $Res Function(ServerException) _then;

/// Create a copy of AppExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ServerException(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NoInternetException implements AppExceptions {
  const NoInternetException();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoInternetException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppExceptions.noInternet()';
}


}




/// @nodoc


class CoreException implements AppExceptions {
  const CoreException(this.message);
  

 final  String? message;

/// Create a copy of AppExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoreExceptionCopyWith<CoreException> get copyWith => _$CoreExceptionCopyWithImpl<CoreException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoreException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppExceptions.core(message: $message)';
}


}

/// @nodoc
abstract mixin class $CoreExceptionCopyWith<$Res> implements $AppExceptionsCopyWith<$Res> {
  factory $CoreExceptionCopyWith(CoreException value, $Res Function(CoreException) _then) = _$CoreExceptionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$CoreExceptionCopyWithImpl<$Res>
    implements $CoreExceptionCopyWith<$Res> {
  _$CoreExceptionCopyWithImpl(this._self, this._then);

  final CoreException _self;
  final $Res Function(CoreException) _then;

/// Create a copy of AppExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(CoreException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UnknownException implements AppExceptions {
  const UnknownException();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppExceptions.unknown()';
}


}




// dart format on
