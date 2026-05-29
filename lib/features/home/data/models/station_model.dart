import 'package:labradio/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StationModel extends StationEntity {
  const StationModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.isActive,
    required super.logo,
    required super.location,
    required super.streams,
    required super.languages,
    required super.isFavorite,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) =>
      _$StationModelFromJson(json);

  Map<String, dynamic> toJson() => _$StationModelToJson(this);
}
