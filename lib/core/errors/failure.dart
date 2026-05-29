import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// A failure is an interface that is used to represent an error
///  failure in the domain layer.
@freezed
sealed class Failure with _$Failure {
  /// [ Failure.serverError] is a failure that is used to represent failure/error from server
  const factory Failure.serverError(String message) = _$ServerFailure;

  /// [ Failure.noInternet] is a failure that is used to represent failure/error from no internet
  const factory Failure.noInternet() = _$NoInternetFailure;

  /// [Failure.unknown()] is a failure that is used to represent failure/error from unknown source
  const factory Failure.unknown() = _$UnknownFailure;

  /// [Failure.app(message)] is a client side error
  const factory Failure.core(String? message) = _$AppFailure;
}

///[ConvertFailureToString] is a helper class that
/// converts a failure to a string
class ConvertFailureToString {
  /// [call] converts a failure to a string

  String call(Failure failure) {
    return switch (failure) {
      _$AppFailure() => failure.message ?? 'An unknown error occurred',
      _$ServerFailure() => failure.message,
      _$NoInternetFailure() =>
        'Please check your internet connection and try again',
      _$UnknownFailure() => 'Unknown error',
    };
  }
}
