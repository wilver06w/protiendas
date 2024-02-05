import 'package:flutter/material.dart';
import 'package:protiendas/app/config/app.dart';
import 'package:protiendas/app/config/module.dart';
import 'package:protiendas/app/utils/config/client_config.dart';
import 'package:protiendas/app/utils/http/http_client.dart';
import 'package:protiendas/app/utils/preferences.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => Preferences()),
      Bind<XigoHttpClient>(
        (i) => XigoHttpClient().getInstance(i<AppConfig>()),
      ),
      Bind(
        (i) {
          return AppConfig()..version = App.instance.version;
        },
        isLazy: false,
      ),
      Bind((i) => GlobalKey<NavigatorState>()),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ModuleRoute('/', module: GlobalModule()),
    ];
  }
}
