import 'package:flutter_modular/flutter_modular.dart';

class YuGiOhRoute {
  static Future<Object?> navDashboard() async {
    return Modular.to.pushNamedAndRemoveUntil(
      '/dashboard',
      (_) => false,
    );
  }

  static Future<Object?> navHome() async {
    return Modular.to.pushNamedAndRemoveUntil(
      '/home',
      (_) => false,
    );
  }

  static Future<Object?> navCart() async {
    return Modular.to.pushNamed('/cart');
  }

  static Future<Object?> navLogin() async {
    return Modular.to.pushNamedAndRemoveUntil(
      '/auth',
      (_) => false,
    );
  }

  static Future<Object?> navAddresses() async {
    return Modular.to.pushNamed('/address/');
  }

  static Future<Object?> navPayment() async {
    return Modular.to.pushNamed('/payment/');
  }
  static Future<Object?> navAddPayment() async {
    return Modular.to.pushNamed('/payment/add');
  }

  static Future<Object?> navAddAddress() async {
    return Modular.to.pushNamed(
      '/address/add',
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
