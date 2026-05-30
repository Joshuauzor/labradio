import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:labradio/features/features.dart';

part 'favorite_state.freezed.dart';

@freezed
sealed class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = FavoriteInitial;
  const factory FavoriteState.loading() = FavoriteLoading;
  const factory FavoriteState.error(String message) = FavoriteError;
  const factory FavoriteState.loaded({
    required List<StationEntity> stations,
    @Default(false) bool isLoadingMore,
  }) = FavoriteLoaded;
}
