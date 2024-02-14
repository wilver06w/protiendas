import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/app/utils/button/btn.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/navigation.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';
import 'package:protiendas/app/widget/app_global.dart';
import 'package:protiendas/app/widget/card_cart/card_product_cart.dart';

part 'package:protiendas/app/screen/cart/_childrens/resumen/_sections/body.dart';
part 'package:protiendas/app/screen/cart/_childrens/resumen/_sections/bottom.dart';
part 'package:protiendas/app/screen/cart/_childrens/resumen/_sections/item_resum.dart';
part 'package:protiendas/app/screen/cart/_childrens/resumen/_sections/item_total.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProTiendasUiColors.white,
      appBar: AppBarGlobal(
        onTapIcon: () {
          Modular.to.pop();
        },
        haveSearch: false,
        title: ProTiendasUiValues.shoppingCart,
        havCart: false,
      ),
      bottomNavigationBar: const Bottom(),
      body: const Body(),
    );
  }
}
