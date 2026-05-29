import 'package:equatable/equatable.dart';

class StationLocationEntity extends Equatable {
  const StationLocationEntity({
    required this.cityName,
    required this.countryName,
    required this.locationText,
  });

  final String? cityName;
  final String? countryName;
  final String? locationText;

  StationLocationEntity copyWith({
    String? cityName,
    String? countryName,
    String? locationText,
  }) {
    return StationLocationEntity(
      cityName: cityName ?? this.cityName,
      countryName: countryName ?? this.countryName,
      locationText: locationText ?? this.locationText,
    );
  }

  @override
  List<Object?> get props => [cityName, countryName, locationText];
}
