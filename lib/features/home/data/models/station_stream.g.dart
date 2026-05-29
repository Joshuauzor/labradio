// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StationStreamModel _$StationStreamModelFromJson(Map<String, dynamic> json) =>
    StationStreamModel(
      url: json['url'] as String,
      codec: json['codec'] as String?,
      bitrate: json['bitrate'] as String?,
    );

Map<String, dynamic> _$StationStreamModelToJson(StationStreamModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'codec': instance.codec,
      'bitrate': instance.bitrate,
    };
