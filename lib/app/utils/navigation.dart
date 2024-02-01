import 'package:flutter_modular/flutter_modular.dart';
import 'package:yugioh/app/models/list_yugioh.dart';

class YuGiOhRoute {
  static Future<Object?> navHome() async {
    return Modular.to.pushNamedAndRemoveUntil(
      '/home',
      (_) => false,
    );
  }

  static Future<Object?> navDetail({
    YuGiOh? yuGiOh,
  }) async {
    return Modular.to.pushNamed(
      '/detail',
      arguments: {
        'yugioh': yuGiOh,
      },
    );
  }
}
