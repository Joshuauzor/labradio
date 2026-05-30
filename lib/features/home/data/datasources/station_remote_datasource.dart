import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';
import 'package:logger/logger.dart';

abstract class StationRemoteDataSource {
  Future<List<StationModel>> getStations({
    required int skip,
    required int limit,
  });
}

@LazySingleton(as: StationRemoteDataSource)
class StationRemoteDataSourceImpl implements StationRemoteDataSource {
  StationRemoteDataSourceImpl({
    required this.networkInfo,
    required this.localDataStorage,
    required this.dio,
  }) {
    // add rapid api headers
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['X-RapidAPI-Key'] =
              dotenv.env[EnvConstants.rapidApiKey];
          options.headers['X-RapidAPI-Host'] =
              dotenv.env[EnvConstants.rapidApiHost];
          handler.next(options);
        },
      ),
    );
    // add retry interceptor
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print, // retry count (optional)
        retryDelays: const [
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 3), // wait 3 sec before third retry
        ],
      ),
    );
    client = StationApiClient(dio, baseUrl: dotenv.env[EnvConstants.baseUrl]!);
  }

  final NetworkInfo networkInfo;
  final LocalDataStorage localDataStorage;
  final Dio dio;
  late final StationApiClient client;

  @override
  Future<List<StationModel>> getStations({
    required int skip,
    required int limit,
  }) async {
    // final aAuthToken = await localDataStorage.getAccessToken();
    // if (aAuthToken == null) {
    //   throw const AppExceptions.core('No access token found, please login');
    // }

    final queries = {'take': limit, 'skip': skip};

    final response = await client.getStations(queries: queries);
    final data = response.data as Map<String, dynamic>;
    final result = data['data'] as List<dynamic>;
    Logger().d(data);

    return result
        .map((e) => StationModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
