import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/src/shared/widget/button/btn.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/constant/navigation.dart';
import 'package:protiendas/src/core/utils/constant/spacing.dart';
import 'package:protiendas/src/core/utils/helpers/text/text.dart';
import 'package:protiendas/src/core/utils/constant/protienda_ui.dart';
import 'package:protiendas/src/shared/widget/app_global.dart';
import 'package:protiendas/src/shared/widget/card_cart/card_product_cart.dart';

part 'package:protiendas/src/features/cart/_childrens/resumen/_sections/body.dart';
part 'package:protiendas/src/features/cart/_childrens/resumen/_sections/bottom.dart';
part 'package:protiendas/src/features/cart/_childrens/resumen/_sections/item_resum.dart';
part 'package:protiendas/src/features/cart/_childrens/resumen/_sections/item_total.dart';

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
