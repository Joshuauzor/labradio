// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_stations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExploreStationsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreStationsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreStationsState()';
}


}

/// @nodoc
class $ExploreStationsStateCopyWith<$Res>  {
$ExploreStationsStateCopyWith(ExploreStationsState _, $Res Function(ExploreStationsState) __);
}


/// Adds pattern-matching-related methods to [ExploreStationsState].
extension ExploreStationsStatePatterns on ExploreStationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExploreStationsInitial value)?  initial,TResult Function( ExploreStationsLoading value)?  loading,TResult Function( ExploreStationsError value)?  error,TResult Function( ExploreStationsLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExploreStationsInitial() when initial != null:
return initial(_that);case ExploreStationsLoading() when loading != null:
return loading(_that);case ExploreStationsError() when error != null:
return error(_that);case ExploreStationsLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExploreStationsInitial value)  initial,required TResult Function( ExploreStationsLoading value)  loading,required TResult Function( ExploreStationsError value)  error,required TResult Function( ExploreStationsLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case ExploreStationsInitial():
return initial(_that);case ExploreStationsLoading():
return loading(_that);case ExploreStationsError():
return error(_that);case ExploreStationsLoaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExploreStationsInitial value)?  initial,TResult? Function( ExploreStationsLoading value)?  loading,TResult? Function( ExploreStationsError value)?  error,TResult? Function( ExploreStationsLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case ExploreStationsInitial() when initial != null:
return initial(_that);case ExploreStationsLoading() when loading != null:
return loading(_that);case ExploreStationsError() when error != null:
return error(_that);case ExploreStationsLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( List<StationEntity> stations,  bool isLoadingMore)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExploreStationsInitial() when initial != null:
return initial();case ExploreStationsLoading() when loading != null:
return loading();case ExploreStationsError() when error != null:
return error(_that.message);case ExploreStationsLoaded() when loaded != null:
return loaded(_that.stations,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( List<StationEntity> stations,  bool isLoadingMore)  loaded,}) {final _that = this;
switch (_that) {
case ExploreStationsInitial():
return initial();case ExploreStationsLoading():
return loading();case ExploreStationsError():
return error(_that.message);case ExploreStationsLoaded():
return loaded(_that.stations,_that.isLoadingMore);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( List<StationEntity> stations,  bool isLoadingMore)?  loaded,}) {final _that = this;
switch (_that) {
case ExploreStationsInitial() when initial != null:
return initial();case ExploreStationsLoading() when loading != null:
return loading();case ExploreStationsError() when error != null:
return error(_that.message);case ExploreStationsLoaded() when loaded != null:
return loaded(_that.stations,_that.isLoadingMore);case _:
  return null;

}
}

}

/// @nodoc


class ExploreStationsInitial implements ExploreStationsState {
  const ExploreStationsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreStationsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreStationsState.initial()';
}


}




/// @nodoc


class ExploreStationsLoading implements ExploreStationsState {
  const ExploreStationsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreStationsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreStationsState.loading()';
}


}




/// @nodoc


class ExploreStationsError implements ExploreStationsState {
  const ExploreStationsError(this.message);
  

 final  String message;

/// Create a copy of ExploreStationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreStationsErrorCopyWith<ExploreStationsError> get copyWith => _$ExploreStationsErrorCopyWithImpl<ExploreStationsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreStationsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ExploreStationsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ExploreStationsErrorCopyWith<$Res> implements $ExploreStationsStateCopyWith<$Res> {
  factory $ExploreStationsErrorCopyWith(ExploreStationsError value, $Res Function(ExploreStationsError) _then) = _$ExploreStationsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ExploreStationsErrorCopyWithImpl<$Res>
    implements $ExploreStationsErrorCopyWith<$Res> {
  _$ExploreStationsErrorCopyWithImpl(this._self, this._then);

  final ExploreStationsError _self;
  final $Res Function(ExploreStationsError) _then;

/// Create a copy of ExploreStationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ExploreStationsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ExploreStationsLoaded implements ExploreStationsState {
  const ExploreStationsLoaded({required final  List<StationEntity> stations, this.isLoadingMore = false}): _stations = stations;
  

 final  List<StationEntity> _stations;
 List<StationEntity> get stations {
  if (_stations is EqualUnmodifiableListView) return _stations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stations);
}

@JsonKey() final  bool isLoadingMore;

/// Create a copy of ExploreStationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreStationsLoadedCopyWith<ExploreStationsLoaded> get copyWith => _$ExploreStationsLoadedCopyWithImpl<ExploreStationsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreStationsLoaded&&const DeepCollectionEquality().equals(other._stations, _stations)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_stations),isLoadingMore);

@override
String toString() {
  return 'ExploreStationsState.loaded(stations: $stations, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $ExploreStationsLoadedCopyWith<$Res> implements $ExploreStationsStateCopyWith<$Res> {
  factory $ExploreStationsLoadedCopyWith(ExploreStationsLoaded value, $Res Function(ExploreStationsLoaded) _then) = _$ExploreStationsLoadedCopyWithImpl;
@useResult
$Res call({
 List<StationEntity> stations, bool isLoadingMore
});




}
/// @nodoc
class _$ExploreStationsLoadedCopyWithImpl<$Res>
    implements $ExploreStationsLoadedCopyWith<$Res> {
  _$ExploreStationsLoadedCopyWithImpl(this._self, this._then);

  final ExploreStationsLoaded _self;
  final $Res Function(ExploreStationsLoaded) _then;

/// Create a copy of ExploreStationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stations = null,Object? isLoadingMore = null,}) {
  return _then(ExploreStationsLoaded(
stations: null == stations ? _self._stations : stations // ignore: cast_nullable_to_non_nullable
as List<StationEntity>,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
