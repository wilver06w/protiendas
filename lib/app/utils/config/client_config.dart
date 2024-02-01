library mobile_client_config;

import 'package:device_info_plus/device_info_plus.dart';

class AppConfig {
  factory AppConfig() {
    return _singleton ?? AppConfig._();
  }

  AppConfig._();

  static AppConfig? _singleton;

  final bool isProd = (const bool.fromEnvironment('dart.vm.product'));

  WebBrowserInfo? infoDevice;

  String version = '0';
}
