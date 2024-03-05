import 'package:flutter_modular/flutter_modular.dart';
import 'package:protiendas/src/core/network/http_client.dart';
import 'package:protiendas/src/features/addresses/module.dart';
import 'package:protiendas/src/features/auth/module.dart';
import 'package:protiendas/src/features/cart/module.dart';
import 'package:protiendas/src/features/dashbo/module.dart';
import 'package:protiendas/src/features/detail/page.dart' as detail;
import 'package:protiendas/src/features/init/page.dart' as init;
import 'package:protiendas/src/features/payment_method/module.dart';

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
        '/detail',
        child: (_, args) => detail.Page(
          product: (args.data ?? {})['product'] ?? {},
        ),
        transition: TransitionType.fadeIn,
      ),
      ModuleRoute('/dashboard', module: DashboardModule()),
      ModuleRoute('/auth', module: AuthModule()),
      ModuleRoute('/address', module: AddressesModule()),
      ModuleRoute('/payment', module: PaymentMethodModule()),
      ModuleRoute('/cart', module: CartModule()),
    ];
  }
}
