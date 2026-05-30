import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:labradio/app.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: StationRepository)
class StationRepositoryImpl implements StationRepository {
  StationRepositoryImpl(this.stationRemoteDataSource);

  final StationRemoteDataSource stationRemoteDataSource;

  @override
  Future<Either<Failure, List<StationEntity>>> getStations({
    required int skip,
    required int limit,
  }) async {
    try {
      final response = await stationRemoteDataSource.getStations(
        skip: skip,
        limit: limit,
      );
      return Right(response);
    } on AppExceptions catch (e) {
      Logger().e(e);
      return Left(switch (e) {
        ServerException(:final message) => Failure.serverError(message),
        NoInternetException() => const Failure.noInternet(),
        CoreException(:final message) => Failure.core(message),
        UnknownException() => const Failure.unknown(),
      });
    } on DioException catch (e) {
      Logger().e(e);
      // check for token expiration
      if (e.response?.statusCode == 401) {
        // push user to re-login
        await customNav.pushNamedAndRemoveUntil(
          AppRoutes.onboarding,
          (route) => false,
        );
        return const Left(Failure.core('Session Expired. Please re-login'));
      }

      // check for no internet connection
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const AppExceptions.noInternet();
      }

      if (e.response?.data != null && e.response?.data != '') {
        Logger().d(e.response?.data as Map<String, dynamic>?);
        return Left(
          Failure.serverError(
            (e.response?.data as Map<String, dynamic>?)?['message']
                    as String? ??
                (e.response?.data as Map<String, dynamic>?)?['error']
                    as String? ??
                e.response?.data.toString() ??
                e.message!,
          ),
        );
      } else {
        return const Left(
          Failure.serverError('Server error, please try again'),
        );
      }
    } on Exception catch (e) {
      Logger().e(e);
      return const Left(Failure.unknown());
    }
  }
}
