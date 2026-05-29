import 'package:equatable/equatable.dart';

class StationStreamEntity extends Equatable {
  const StationStreamEntity({
    required this.url,
    required this.codec,
    required this.bitrate,
  });

  final String url;
  final String? codec;
  final int? bitrate;

  StationStreamEntity copyWith({String? url, String? codec, int? bitrate}) {
    return StationStreamEntity(
      url: url ?? this.url,
      codec: codec ?? this.codec,
      bitrate: bitrate ?? this.bitrate,
    );
  }

  @override
  List<Object?> get props => [url, codec, bitrate];
}
