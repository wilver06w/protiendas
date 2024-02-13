import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protiendas/app/screen/dashboard/bloc/bloc.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';
import 'package:protiendas/app/screen/home/page.dart' as home;
import 'package:protiendas/app/screen/notifications/page.dart' as notifications;
import 'package:protiendas/app/screen/favorites/page.dart' as favorites;
import 'package:protiendas/app/screen/profile/page.dart' as profile;

part 'package:protiendas/app/screen/dashboard/_sections/body.dart';
part 'package:protiendas/app/screen/dashboard/_sections/item_dashboard.dart';
part 'package:protiendas/app/screen/dashboard/_sections/bottom_navigator.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<BlocDashboard>(),
      child: Scaffold(
        bottomNavigationBar: const BottomNavigator(),
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {
            if (Modular.get<BlocDashboard>().state.model.position == 0) {
              SystemNavigator.pop();
              return;
            }
            Modular.get<BlocDashboard>()
                .add(const ChangePositionEvent(position: 0));
          },
          child: const Body(),
        ),
      ),
    );
  }
}
