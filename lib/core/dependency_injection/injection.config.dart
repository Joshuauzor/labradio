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
import 'package:labradio/core/analytics/google_analytics.dart' as _i393;
import 'package:labradio/core/app_info/app_version.dart' as _i752;
import 'package:labradio/core/app_info/device_info.dart' as _i231;
import 'package:labradio/core/dependency_injection/register_module.dart'
    as _i649;
import 'package:labradio/core/local_data/local_data_storage.dart' as _i235;
import 'package:labradio/core/network/network_info.dart' as _i876;
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
    await gh.factoryAsync<_i655.PackageInfo>(
      () => registerModule.getPackageInfo(),
      preResolve: true,
    );
    gh.lazySingleton<_i393.GoogleAnalytics>(() => _i393.GoogleAnalytics());
    gh.lazySingleton<_i235.LocalDataStorage>(
      () => _i235.LocalDataStorageImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i876.NetworkInfo>(
      () => _i876.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i752.AppVersion>(
      () => _i752.AppVersion(packageInfo: gh<_i655.PackageInfo>()),
    );
    gh.lazySingleton<_i231.DeviceInfo>(
      () => _i231.DeviceInfo(deviceInfo: gh<_i833.DeviceInfoPlugin>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i649.RegisterModule {}
