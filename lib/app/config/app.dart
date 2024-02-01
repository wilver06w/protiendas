import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yugioh/app/utils/preferences.dart';

class App {
  static final instance = App._();

  final navigatorKey = GlobalKey<NavigatorState>();

  Map<String, dynamic> config = {};
  String version = '';
  WebBrowserInfo? infoDevice;

  App._();

  Future<void> init() async {
    Intl.defaultLocale = 'es';

    final prefs = Preferences();

    await prefs.init();

    await _setPreferredOrientations();

    try {
      PackageInfo dataPlatform = await PackageInfo.fromPlatform();
      version = dataPlatform.version;
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      if (kIsWeb) {
        final deviceData = await deviceInfoPlugin.webBrowserInfo;
        infoDevice = deviceData;
      }
    } catch (_) {}
  }

  Future<void> _setPreferredOrientations() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
