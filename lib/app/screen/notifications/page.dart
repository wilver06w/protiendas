import 'package:flutter/material.dart';
import 'package:protiendas/app/utils/protiendas_ui.dart';
import 'package:protiendas/app/widget/app_global.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGlobal(
        onTapIcon: () {},
        haveSearch: false,
        title: ProTiendasUiValues.notifications,
      ),
      body: Center(
        child: Text(
          ProTiendasUiValues.notifications,
        ),
      ),
    );
  }
}
