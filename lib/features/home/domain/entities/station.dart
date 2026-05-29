import 'package:equatable/equatable.dart';
import 'package:labradio/features/features.dart';

class StationEntity extends Equatable {
  const StationEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.isActive,
    required this.logo,
    required this.location,
    required this.streams,
    required this.languages,
    required this.isFavorite,
  });

  final int id;
  final String name;
  final String? slug;
  final bool isActive;
  final String? logo;
  final StationLocationModel? location;
  final List<StationStreamModel> streams;
  final List<StationLanguageModel> languages;
  final bool? isFavorite;

  StationEntity copyWith({
    int? id,
    String? name,
    String? slug,
    bool? isActive,
    String? logo,
    StationLocationModel? location,
    List<StationStreamModel>? streams,
    List<StationLanguageModel>? languages,
    bool? isFavorite,
  }) {
    return StationEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      isActive: isActive ?? this.isActive,
      logo: logo ?? this.logo,
      location: location ?? this.location,
      streams: streams ?? this.streams,
      languages: languages ?? this.languages,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    isActive,
    logo,
    location,
    streams,
    languages,
    location,
    isFavorite,
  ];
}
