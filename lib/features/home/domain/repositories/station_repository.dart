import 'package:dartz/dartz.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

abstract class StationRepository {
  Future<Either<Failure, List<StationEntity>>> getStations({
    required int skip,
    required int limit,
  });
}
