import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeviceInfo {
  DeviceInfo({required this.deviceInfo});

  final DeviceInfoPlugin deviceInfo;

  Future<String> getDeviceModel() async {
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine;
    } else {
      return 'Unsupported Platform';
    }
  }
}
