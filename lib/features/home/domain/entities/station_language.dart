import 'package:equatable/equatable.dart';

class StationLanguageEntity extends Equatable {
  const StationLanguageEntity({required this.code, required this.name});

  final String? code;
  final String? name;

  StationLanguageEntity copyWith({String? code, String? name}) {
    return StationLanguageEntity(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [code, name];
}
