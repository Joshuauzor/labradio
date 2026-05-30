import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({
    required this.getFavoriteStationsUseCase,
    required this.removeFromFavoritesUseCase,
  }) : super(const FavoriteState.initial());

  final GetFavoriteStationsUseCase getFavoriteStationsUseCase;
  final RemoveFromFavoritesUseCase removeFromFavoritesUseCase;

  List<StationEntity> _stations = [];
  List<StationEntity> get stations => _stations;
  bool _loadingMore = false;
  bool _hasMore = false;

  Future<void> getFavoriteStations({
    required int skip,
    int limit = 10,
    bool reload = true, // enable loading state
    bool reset = true, // reset all values
    bool loadMore = false, // load more data
  }) async {
    // enable loading state
    if (reload) {
      emit(const FavoriteState.loading());
    }
    // reset all values
    if (reset) {
      _stations = [];
      _hasMore = false;
      _loadingMore = false;
    }

    // load more data
    if (loadMore) {
      // prevent multiple loading and stop at last data
      if (_loadingMore || !_hasMore) {
        return;
      }
      _loadingMore = true;
      emit(
        FavoriteState.loaded(stations: _stations, isLoadingMore: _loadingMore),
      );
    }

    final result = await getFavoriteStationsUseCase(
      GetFavoriteStationsUseCaseParams(skip: skip, limit: limit),
    );

    emit(
      await result.fold(
        (failure) => FavoriteState.error(ConvertFailureToString()(failure)),
        (stations) async {
          // update stations
          _stations.addAll(stations);
          _hasMore = stations.length >= limit;
          _loadingMore = false;

          return FavoriteState.loaded(
            stations: _stations,
            isLoadingMore: _loadingMore,
          );
        },
      ),
    );
  }

  // remove from favorites
  Future<void> removeFromFavorites({required int stationId}) async {
    emit(const FavoriteState.loading());
    final stationIndex = _stations.indexWhere(
      (station) => station.id == stationId,
    );
    if (stationIndex == -1) {
      return;
    }
    final station = _stations[stationIndex];
    _stations.removeAt(stationIndex);
    emit(FavoriteState.loaded(stations: _stations));

    // save the model to local storage since backend is not ready yet
    final result = await removeFromFavoritesUseCase(
      RemoveFromFavoritesUseCaseParams(station: station),
    );

    emit(
      await result.fold(
        (failure) {
          _stations.insert(stationIndex, station);
          return FavoriteState.loaded(stations: _stations);
        },
        (data) {
          return FavoriteState.loaded(
            stations: List<StationEntity>.from(_stations),
          );
        },
      ),
    );
  }
}
