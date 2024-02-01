import 'package:flutter_modular/flutter_modular.dart';
import 'package:yugioh/app/screen/detail/page.dart' as detail;
import 'package:yugioh/app/screen/home/page.dart' as home;
import 'package:yugioh/app/screen/init/page.dart' as init;

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
    ];
  }
}
