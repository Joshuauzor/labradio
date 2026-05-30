import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

abstract class FavoriteRemoteDataSource {
  Future<void> addToFavorites({required StationEntity station});

  Future<void> removeFromFavorites({required StationEntity station});

  Future<List<StationEntity>> getFavoriteStations({
    required int skip,
    required int limit,
  });
}

@LazySingleton(as: FavoriteRemoteDataSource)
class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  FavoriteRemoteDataSourceImpl({
    required this.networkInfo,
    required this.localDataStorage,
  }) {}

  final NetworkInfo networkInfo;
  final LocalDataStorage localDataStorage;

  @override
  Future<void> addToFavorites({required StationEntity station}) async {
    await localDataStorage.saveFavoriteStations(station);
  }

  @override
  Future<void> removeFromFavorites({required StationEntity station}) async {
    await localDataStorage.removeFavoriteStation(station);
  }

  @override
  Future<List<StationEntity>> getFavoriteStations({
    required int skip,
    required int limit,
  }) async {
    return await localDataStorage.getFavoriteStations() ?? [];
  }
}
