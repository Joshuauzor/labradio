import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:labradio/features/features.dart';

part 'station_location.g.dart';

@JsonSerializable()
class StationLocationModel extends StationLocationEntity {
  const StationLocationModel({
    required super.cityName,
    required super.countryName,
    required super.locationText,
  });

  factory StationLocationModel.fromJson(Map<String, dynamic> json) =>
      _$StationLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$StationLocationModelToJson(this);
}
