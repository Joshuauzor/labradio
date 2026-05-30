// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i833;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:just_audio/just_audio.dart' as _i501;
import 'package:labradio/core/analytics/google_analytics.dart' as _i393;
import 'package:labradio/core/app_info/app_version.dart' as _i752;
import 'package:labradio/core/app_info/device_info.dart' as _i231;
import 'package:labradio/core/core.dart' as _i30;
import 'package:labradio/core/dependency_injection/register_module.dart'
    as _i649;
import 'package:labradio/core/local_data/local_data_storage.dart' as _i235;
import 'package:labradio/core/network/network_info.dart' as _i876;
import 'package:labradio/core/services/audio_controller.dart' as _i1040;
import 'package:labradio/features/favorites/data/datasources/favorite_remote_datasource.dart'
    as _i440;
import 'package:labradio/features/favorites/data/repositories/favorite_repository_impl.dart'
    as _i238;
import 'package:labradio/features/favorites/domain/usecases/add_to_favorites_usecase.dart'
    as _i469;
import 'package:labradio/features/favorites/domain/usecases/get_favorite_stations_usecase.dart'
    as _i1064;
import 'package:labradio/features/favorites/domain/usecases/remove_from_favorites_usecase.dart'
    as _i249;
import 'package:labradio/features/features.dart' as _i396;
import 'package:labradio/features/home/data/datasources/station_remote_datasource.dart'
    as _i521;
import 'package:labradio/features/home/data/repositories/station_repository_impl.dart'
    as _i65;
import 'package:labradio/features/home/domain/usecases/get_stations_usecase.dart'
    as _i336;
import 'package:package_info_plus/package_info_plus.dart' as _i655;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i558.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage,
    );
    gh.factory<_i833.DeviceInfoPlugin>(() => registerModule.deviceInfo);
    gh.factory<_i973.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker,
    );
    gh.factory<_i501.AudioPlayer>(() => registerModule.audioPlayer);
    await gh.factoryAsync<_i655.PackageInfo>(
      () => registerModule.getPackageInfo(),
      preResolve: true,
    );
    gh.lazySingleton<_i393.GoogleAnalytics>(() => _i393.GoogleAnalytics());
    gh.lazySingleton<_i1040.AudioController>(
      () => _i1040.AudioController(gh<_i501.AudioPlayer>()),
    );
    gh.lazySingleton<_i235.LocalDataStorage>(
      () => _i235.LocalDataStorageImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i876.NetworkInfo>(
      () => _i876.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i752.AppVersion>(
      () => _i752.AppVersion(packageInfo: gh<_i655.PackageInfo>()),
    );
    gh.lazySingleton<_i521.StationRemoteDataSource>(
      () => _i521.StationRemoteDataSourceImpl(
        networkInfo: gh<_i30.NetworkInfo>(),
        localDataStorage: gh<_i30.LocalDataStorage>(),
        dio: gh<_i361.Dio>(),
      ),
    );
    gh.lazySingleton<_i231.DeviceInfo>(
      () => _i231.DeviceInfo(deviceInfo: gh<_i833.DeviceInfoPlugin>()),
    );
    gh.lazySingleton<_i440.FavoriteRemoteDataSource>(
      () => _i440.FavoriteRemoteDataSourceImpl(
        networkInfo: gh<_i30.NetworkInfo>(),
        localDataStorage: gh<_i30.LocalDataStorage>(),
      ),
    );
    gh.lazySingleton<_i396.StationRepository>(
      () => _i65.StationRepositoryImpl(gh<_i396.StationRemoteDataSource>()),
    );
    gh.lazySingleton<_i396.FavoriteRepository>(
      () => _i238.FavoriteRepositoryImpl(gh<_i396.FavoriteRemoteDataSource>()),
    );
    gh.lazySingleton<_i469.AddToFavoritesUseCase>(
      () => _i469.AddToFavoritesUseCase(gh<_i396.FavoriteRepository>()),
    );
    gh.lazySingleton<_i1064.GetFavoriteStationsUseCase>(
      () => _i1064.GetFavoriteStationsUseCase(gh<_i396.FavoriteRepository>()),
    );
    gh.lazySingleton<_i249.RemoveFromFavoritesUseCase>(
      () => _i249.RemoveFromFavoritesUseCase(gh<_i396.FavoriteRepository>()),
    );
    gh.lazySingleton<_i336.GetStationsUseCase>(
      () => _i336.GetStationsUseCase(gh<_i396.StationRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i649.RegisterModule {}
