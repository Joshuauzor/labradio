import 'package:equatable/equatable.dart';

class StationStreamEntity extends Equatable {
  const StationStreamEntity({
    required this.url,
    required this.codec,
    required this.bitrate,
  });

  final String url;
  final String? codec;
  final String? bitrate;

  StationStreamEntity copyWith({String? url, String? codec, String? bitrate}) {
    return StationStreamEntity(
      url: url ?? this.url,
      codec: codec ?? this.codec,
      bitrate: bitrate ?? this.bitrate,
    );
  }

  @override
  List<Object?> get props => [url, codec, bitrate];
}
