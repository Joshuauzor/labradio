import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

@lazySingleton
class GetFavoriteStationsUseCase
    implements UseCase<List<StationEntity>, GetFavoriteStationsUseCaseParams> {
  GetFavoriteStationsUseCase(this.repository);

  final FavoriteRepository repository;

  @override
  Future<Either<Failure, List<StationEntity>>> call(
    GetFavoriteStationsUseCaseParams params,
  ) async {
    return repository.getFavoriteStations(
      skip: params.skip,
      limit: params.limit,
    );
  }
}

class GetFavoriteStationsUseCaseParams extends Equatable {
  const GetFavoriteStationsUseCaseParams({
    required this.skip,
    required this.limit,
  });

  final int skip;
  final int limit;

  @override
  List<Object?> get props => [skip, limit];
}
