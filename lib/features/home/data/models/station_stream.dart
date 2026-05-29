import 'package:labradio/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_stream.g.dart';

@JsonSerializable()
class StationStreamModel extends StationStreamEntity {
  const StationStreamModel({
    required super.url,
    required super.codec,
    required super.bitrate,
  });

  factory StationStreamModel.fromJson(Map<String, dynamic> json) =>
      _$StationStreamModelFromJson(json);

  Map<String, dynamic> toJson() => _$StationStreamModelToJson(this);
}
