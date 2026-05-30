import 'package:dartz/dartz.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, void>> addToFavorites({
    required StationEntity station,
  });

  Future<Either<Failure, void>> removeFromFavorites({
    required StationEntity station,
  });

  Future<Either<Failure, List<StationEntity>>> getFavoriteStations({
    required int skip,
    required int limit,
  });
}
