import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';

/// [AppExceptions] is thrown when there is an error.
@freezed
sealed class AppExceptions with _$AppExceptions implements Exception {
  /// [AppExceptions.server] is thrown when there is a server error.
  const factory AppExceptions.server(String message) = ServerException;

  /// [AppExceptions.noInternet] is thrown when there
  /// is no internet connection.
  const factory AppExceptions.noInternet() = NoInternetException;

  /// [AppExceptions.core] is thrown when there
  /// is an error in the app.
  const factory AppExceptions.core(String? message) = CoreException;

  /// [AppException.sessionExpiration(message)] is thrown when there
  /// is an error in the app.

  /// [AppExceptions.unknown()] is thrown when there is an unknown error.
  const factory AppExceptions.unknown() = UnknownException;
}
