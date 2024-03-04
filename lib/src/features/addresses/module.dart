import 'package:flutter_modular/flutter_modular.dart';
import 'package:protiendas/src/features/addresses/home/page.dart' as address;
import 'package:protiendas/src/features/addresses/add/page.dart' as add;

class AddressesModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const address.Page(),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/add',
        child: (_, args) => const add.Page(),
        transition: TransitionType.fadeIn,
      ),
    ];
  }
}
