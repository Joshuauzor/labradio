import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';
import 'package:logger/logger.dart';

class ExploreStationsCubit extends Cubit<ExploreStationsState> {
  ExploreStationsCubit({required this.getStationsUseCase})
    : super(const ExploreStationsState.initial());

  final GetStationsUseCase getStationsUseCase;

  List<StationEntity> _stations = [];
  List<StationEntity> get stations => _stations;
  bool _loadingMore = false;
  bool _hasMore = false;

  Future<void> getStations({
    required int skip,
    int limit = 10,
    bool reload = true, // enable loading state
    bool reset = true, // reset all values
    bool loadMore = false, // load more data
  }) async {
    // enable loading state
    if (reload) {
      emit(const ExploreStationsState.loading());
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
        ExploreStationsState.loaded(
          stations: _stations,
          isLoadingMore: _loadingMore,
        ),
      );
    }

    final result = await getStationsUseCase(
      GetStationsUseCaseParams(skip: skip, limit: limit),
    );

    emit(
      await result.fold(
        (failure) =>
            ExploreStationsState.error(ConvertFailureToString()(failure)),
        (stations) async {
          // update stations
          _stations.addAll(stations);
          _hasMore = stations.length >= limit;
          _loadingMore = false;

          return ExploreStationsState.loaded(
            stations: _stations,
            isLoadingMore: _loadingMore,
          );
        },
      ),
    );
  }
}
