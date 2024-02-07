import 'package:flutter_modular/flutter_modular.dart';
import 'package:protiendas/app/screen/auth/module.dart';
import 'package:protiendas/app/screen/detail/page.dart' as detail;
import 'package:protiendas/app/screen/home/page.dart' as home;
import 'package:protiendas/app/screen/init/page.dart' as init;

class GlobalModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const init.Page(),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/home',
        child: (_, args) => const home.Page(),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/detail',
        child: (_, args) => detail.Page(
          itemYuGiOh: (args.data ?? {})['yugioh'] ?? {},
        ),
        transition: TransitionType.fadeIn,
      ),
      ModuleRoute('/auth', module: AuthModule()),

    ];
  }
}
