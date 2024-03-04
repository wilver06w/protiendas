import 'package:flutter/material.dart';
import 'package:protiendas/src/core/utils/constant/protienda_ui.dart';
import 'package:protiendas/src/shared/widget/app_global.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGlobal(
        onTapIcon: () {},
        haveSearch: false,
        title: ProTiendasUiValues.myProfile,
        havCart: false,
      ),
      body: Center(
        child: Text(
          ProTiendasUiValues.myProfile,
        ),
      ),
    );
  }
}
