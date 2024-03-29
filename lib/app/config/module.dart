import 'package:flutter_modular/flutter_modular.dart';
import 'package:protiendas/app/screen/addresses/module.dart';
import 'package:protiendas/app/screen/auth/module.dart';
import 'package:protiendas/app/screen/cart/module.dart';
import 'package:protiendas/app/screen/dashboard/page.dart' as dashboard;
import 'package:protiendas/app/screen/detail/page.dart' as detail;
import 'package:protiendas/app/screen/home/page.dart' as home;
import 'package:protiendas/app/screen/init/page.dart' as init;
import 'package:protiendas/app/screen/payment_method/module.dart';

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
        '/dashboard',
        child: (_, args) => const dashboard.Page(),
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
          product: (args.data ?? {})['product'] ?? {},
        ),
        transition: TransitionType.fadeIn,
      ),
      ModuleRoute('/auth', module: AuthModule()),
      ModuleRoute('/address', module: AddressesModule()),
      ModuleRoute('/payment', module: PaymentMethodModule()),
      ModuleRoute('/cart', module: CartModule()),
    ];
  }
}
