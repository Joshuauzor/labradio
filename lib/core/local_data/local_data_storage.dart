import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataStorage {
  Future<void> saveAccessToken(String token);

  Future<String?> getAccessToken();

  // Future<void> saveUser(UserModel user);

  // Future<UserModel?> getUser();

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

  // @override
  // Future<void> saveUser(UserModel user) {
  //   return storage.write(key: userKey, value: json.encode(user.toJson()));
  // }

  // @override
  // Future<UserModel?> getUser() {
  //   return storage.read(key: userKey).then((value) {
  //     if (value == null) {
  //       return null;
  //     }
  //     return UserModel.fromJson(json.decode(value) as Map<String, dynamic>);
  //   });
  // }

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
