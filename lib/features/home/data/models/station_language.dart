import 'package:labradio/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_language.g.dart';

@JsonSerializable()
class StationLanguageModel extends StationLanguageEntity {
  const StationLanguageModel({required super.code, required super.name});

  factory StationLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$StationLanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$StationLanguageModelToJson(this);
}
