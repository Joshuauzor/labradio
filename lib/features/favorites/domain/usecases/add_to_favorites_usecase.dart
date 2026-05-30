import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

@lazySingleton
class AddToFavoritesUseCase
    implements UseCase<void, AddToFavoritesUseCaseParams> {
  AddToFavoritesUseCase(this.repository);

  final FavoriteRepository repository;

  @override
  Future<Either<Failure, void>> call(AddToFavoritesUseCaseParams params) async {
    return repository.addToFavorites(station: params.station);
  }
}

class AddToFavoritesUseCaseParams extends Equatable {
  const AddToFavoritesUseCaseParams({required this.station});

  final StationEntity station;

  @override
  List<Object?> get props => [station];
}
