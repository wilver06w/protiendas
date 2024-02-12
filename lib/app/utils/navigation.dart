import 'package:flutter_modular/flutter_modular.dart';

class YuGiOhRoute {
  static Future<Object?> navHome() async {
    return Modular.to.pushNamedAndRemoveUntil(
      '/home',
      (_) => false,
    );
  }

  static Future<Object?> navLogin() async {
    return Modular.to.pushNamedAndRemoveUntil(
      '/auth',
      (_) => false,
    );
  }

  static Future<Object?> navRegister() async {
    return Modular.to.pushNamed('/auth/register');
  }

  static Future<Object?> navDetail({
    String? product,
  }) async {
    return Modular.to.pushNamed(
      '/detail',
      arguments: {
        'product': product,
      },
    );
  }
}
