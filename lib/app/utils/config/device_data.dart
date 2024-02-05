import 'dart:async';
import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:protiendas/app/utils/config/client_config.dart';

class DeviceData {
  static Future<Map<String, dynamic>> getDataDevice() async {
    Map<String, dynamic> data = {};
    final appConfig = Modular.get<AppConfig>();
    String? fcm;
    String fbid = '';

    if (Platform.isAndroid) {
      final androidDeviceId = await _getAndroidDeviceId();
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      data = {
        'type': 'android',
        'app_version': appConfig.version,
        'model': androidInfo.model != '' ? androidInfo.model : 'unknown',
        'device_id': androidDeviceId,
        'os_version': androidInfo.version.release != 'null'
            ? androidInfo.version.release
            : 'unknown',
        'fcm': fcm,
        'firebase_installation_id': fbid,
      };
    } else if (Platform.isIOS) {
      final iosInfo = await DeviceInfoPlugin().iosInfo;

      data = {
        'type': 'ios',
        'app_version': appConfig.version,
        'model': iosInfo.model != 'null' ? iosInfo.model : 'unknown',
        'device_id': iosInfo.identifierForVendor != 'null'
            ? iosInfo.identifierForVendor
            : 'unknown',
        'os_version':
            iosInfo.utsname.version != '' ? iosInfo.utsname.version : 'unknown',
        'fcm': fcm,
        'firebase_installation_id': fbid,
      };
    }
    return data;
  }

  static Future<String> _getAndroidDeviceId() async {
    String id = 'unknown';
    const androidIdPlugin = AndroidId();
    try {
      id = await androidIdPlugin.getId() ?? 'unknown';
    } on PlatformException {
      id = 'unknown';
    }
    return id;
  }
}
