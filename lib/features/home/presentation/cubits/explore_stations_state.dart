import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:labradio/features/features.dart';

part 'explore_stations_state.freezed.dart';

@freezed
sealed class ExploreStationsState with _$ExploreStationsState {
  const factory ExploreStationsState.initial() = ExploreStationsInitial;
  const factory ExploreStationsState.loading() = ExploreStationsLoading;
  const factory ExploreStationsState.error(String message) =
      ExploreStationsError;
  const factory ExploreStationsState.loaded({
    required List<StationEntity> stations,
    @Default(false) bool isLoadingMore,
  }) = ExploreStationsLoaded;
}
