import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:protiendas/app/screen/init/bloc/bloc.dart' as bloc;
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/config/client_config.dart';
import 'package:protiendas/app/utils/navigation.dart';
import 'package:protiendas/app/utils/preferences.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';

part 'package:protiendas/app/screen/init/listeners/core.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    final prefs = Modular.get<Preferences>();
    return Scaffold(
      backgroundColor: YuGiOhColors.backgroundColor,
      body: BlocProvider(
        create: (context) => bloc.Bloc(
          app: app,
          prefs: prefs,
        )..add(bloc.InitEvent()),
        child: BlocListener<bloc.Bloc, bloc.State>(
          listener: listener,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  YuGiOhUiValues.acacomproLogo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
