import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:labradio/features/features.dart';
part 'radio_player_state.freezed.dart';

@freezed
class RadioPlayerState with _$RadioPlayerState {
  const factory RadioPlayerState.initial() = _$Initial;
  const factory RadioPlayerState.loading() = _$Loading;
  const factory RadioPlayerState.error(String message) = _$Error;
  const factory RadioPlayerState.loaded({required StationEntity? station}) =
      _$Loaded;
}
