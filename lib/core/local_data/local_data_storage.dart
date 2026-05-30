import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:labradio/features/features.dart';

abstract class LocalDataStorage {
  Future<void> saveAccessToken(String token);

  Future<String?> getAccessToken();

  Future<void> saveFavoriteStations(StationEntity station);

  Future<List<StationEntity>?> getFavoriteStations();

  Future<void> removeFavoriteStation(StationEntity station);

  Future<void> saveThemePreference(String themeMode);

  Future<String?> getThemePreference();

  Future<void> clear();
}

@LazySingleton(as: LocalDataStorage)
class LocalDataStorageImpl implements LocalDataStorage {
  LocalDataStorageImpl(this.storage);

  final FlutterSecureStorage storage;

  @override
  Future<void> clear() async {
    await storage.deleteAll();
  }

  @override
  Future<void> saveAccessToken(String token) {
    return storage.write(key: accessToken, value: token);
  }

  @override
  Future<String?> getAccessToken() {
    return storage.read(key: accessToken);
  }

  @override
  Future<void> saveFavoriteStations(StationEntity station) async {
    final favoriteStations = await getFavoriteStations() ?? [];
    if (favoriteStations.any(
      (s) => s.id == station.id || s.name == station.name,
    )) {
      return;
    }
    final newFavoriteStations = [...favoriteStations, station];
    await storage.write(
      key: favoriteStationsKey,
      value: _encodeFavoriteStations(newFavoriteStations),
    );
  }

  @override
  Future<List<StationEntity>?> getFavoriteStations() async {
    final value = await storage.read(key: favoriteStationsKey);
    if (value == null) {
      return null;
    }
    return _decodeFavoriteStations(value);
  }

  @override
  Future<void> removeFavoriteStation(StationEntity station) async {
    final favoriteStations = await getFavoriteStations();
    if (favoriteStations == null) {
      return;
    }
    final newFavoriteStations = favoriteStations
        .where((element) => element.id != station.id)
        .toList();
    await storage.write(
      key: favoriteStationsKey,
      value: _encodeFavoriteStations(newFavoriteStations),
    );
  }

  StationModel _toStationModel(StationEntity station) {
    if (station is StationModel) {
      return station;
    }
    return StationModel(
      id: station.id,
      name: station.name,
      slug: station.slug,
      isActive: station.isActive,
      logo: station.logo,
      location: station.location,
      streams: station.streams,
      languages: station.languages,
      isFavorite: station.isFavorite,
    );
  }

  String _encodeFavoriteStations(List<StationEntity> stations) {
    return json.encode(
      stations.map((s) => _toStationModel(s).toJson()).toList(),
    );
  }

  List<StationEntity> _decodeFavoriteStations(String value) {
    final list = json.decode(value) as List<dynamic>;
    return list
        .map((e) => StationModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> saveThemePreference(String themeMode) {
    return storage.write(key: themePreference, value: themeMode);
  }

  @override
  Future<String?> getThemePreference() {
    return storage.read(key: themePreference);
  }
}

const String accessToken = 'accessToken';
const String userKey = 'user';
const String themePreference = 'themePreference';
const String favoriteStationsKey = 'favorite_stations';
