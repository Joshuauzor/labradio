// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StationModel _$StationModelFromJson(Map<String, dynamic> json) => StationModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String,
  isActive: json['isActive'] as bool,
  logo: json['logo'] as String,
  location: json['location'] == null
      ? null
      : StationLocationModel.fromJson(json['location'] as Map<String, dynamic>),
  streams: (json['streams'] as List<dynamic>)
      .map((e) => StationStreamModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  languages: (json['languages'] as List<dynamic>)
      .map((e) => StationLanguageModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  isFavorite: json['isFavorite'] as bool?,
);

Map<String, dynamic> _$StationModelToJson(StationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'isActive': instance.isActive,
      'logo': instance.logo,
      'location': instance.location?.toJson(),
      'streams': instance.streams.map((e) => e.toJson()).toList(),
      'languages': instance.languages.map((e) => e.toJson()).toList(),
      'isFavorite': instance.isFavorite,
    };
