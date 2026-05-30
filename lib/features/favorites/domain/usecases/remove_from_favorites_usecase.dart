import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

@lazySingleton
class RemoveFromFavoritesUseCase
    implements UseCase<void, RemoveFromFavoritesUseCaseParams> {
  RemoveFromFavoritesUseCase(this.repository);

  final FavoriteRepository repository;

  @override
  Future<Either<Failure, void>> call(
    RemoveFromFavoritesUseCaseParams params,
  ) async {
    return repository.removeFromFavorites(station: params.station);
  }
}

class RemoveFromFavoritesUseCaseParams extends Equatable {
  const RemoveFromFavoritesUseCaseParams({required this.station});

  final StationEntity station;

  @override
  List<Object?> get props => [station];
}
