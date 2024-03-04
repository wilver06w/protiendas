import 'package:flutter/material.dart';
import 'package:protiendas/src/core/config/app.dart';
import 'package:protiendas/src/shared/module.dart';
import 'package:protiendas/src/features/dashboard/bloc/bloc.dart';
import 'package:protiendas/src/core/utils/config/client_config.dart';
import 'package:protiendas/src/core/network/http_client.dart';
import 'package:protiendas/src/core/utils/preferences.dart';

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
          return AppConfig(
            environment: App.instance.environment,
            config: App.instance.config,
          )..version = App.instance.version;
        },
        isLazy: false,
      ),
      Bind.lazySingleton((i) => BlocDashboard()),
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
