// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StationLocationModel _$StationLocationModelFromJson(
  Map<String, dynamic> json,
) => StationLocationModel(
  cityName: json['cityName'] as String?,
  countryName: json['countryName'] as String?,
  locationText: json['locationText'] as String?,
);

Map<String, dynamic> _$StationLocationModelToJson(
  StationLocationModel instance,
) => <String, dynamic>{
  'cityName': instance.cityName,
  'countryName': instance.countryName,
  'locationText': instance.locationText,
};
