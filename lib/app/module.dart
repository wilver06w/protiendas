import 'package:flutter/material.dart';
import 'package:yugioh/app/config/app.dart';
import 'package:yugioh/app/config/module.dart';
import 'package:yugioh/app/utils/config/client_config.dart';
import 'package:yugioh/app/utils/http/http_client.dart';
import 'package:yugioh/app/utils/preferences.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => Preferences()),
      Bind<YuGiOhHttpClient>(
        (i) => YuGiOhHttpClient().getInstance(),
      ),
      Bind(
        (i) {
          return AppConfig()
            ..version = App.instance.version
            ..infoDevice = App.instance.infoDevice;
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
