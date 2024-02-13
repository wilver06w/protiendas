import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';
import 'package:protiendas/app/widget/app_global.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGlobal(
        onTapIcon: () {
          Modular.to.pop();
        },
        haveSearch: false,
        title: ProTiendasUiValues.shoppingCart,
        havCart: false,
      ),
      body: Center(
        child: Text(
          ProTiendasUiValues.shoppingCart,
        ),
      ),
    );
  }
}
