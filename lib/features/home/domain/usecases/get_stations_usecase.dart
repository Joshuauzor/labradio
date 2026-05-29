import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

@lazySingleton
class GetStationsUseCase
    implements UseCase<List<StationEntity>, GetStationsUseCaseParams> {
  GetStationsUseCase(this.repository);

  final StationRepository repository;

  @override
  Future<Either<Failure, List<StationEntity>>> call(
    GetStationsUseCaseParams params,
  ) async {
    return repository.getStations(skip: params.skip, limit: params.limit);
  }
}

class GetStationsUseCaseParams extends Equatable {
  const GetStationsUseCaseParams({required this.skip, required this.limit});

  final int skip;
  final int limit;

  @override
  List<Object?> get props => [skip, limit];
}
