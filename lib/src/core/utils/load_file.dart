import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:protiendas/src/core/utils/config/environment.dart';

const String environment = String.fromEnvironment('environment');

class LoadConfigFile {
  static Future<Map<String, dynamic>> load(Environment env) async {
    String path = 'config/app_config_dev.json';
    Map<String, dynamic> data;
    switch (env) {
      case Environment.prod:
        path = 'config/app_config_prod.json';
        break;
      case Environment.dev:
        path = 'config/app_config_dev.json';
        break;
    }

    final file = await rootBundle.loadString(path);
    data = json.decode(file) ?? {};
    return data;
  }

  static Environment getEnv() {
    return Environment.values.singleWhere(
      (value) => value.value == environment,
      orElse: () => Environment.dev,
    );
  }

  /// Tag random que se crea cada vez que el usuario ingresa para
  /// enviar a Sentry y poder hacer un traqueo de errores
  static String generateRandomString() {
    final r = Random();
    const len = 9;
    const chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }
}
