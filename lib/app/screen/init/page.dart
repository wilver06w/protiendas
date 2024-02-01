import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yugioh/app/screen/init/bloc/bloc.dart' as bloc;
import 'package:yugioh/app/utils/colors.dart';
import 'package:yugioh/app/utils/config/client_config.dart';
import 'package:yugioh/app/utils/navigation.dart';
import 'package:yugioh/app/utils/preferences.dart';
import 'package:yugioh/app/utils/yugioh_ui.dart';

part 'package:yugioh/app/screen/init/listeners/core.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    final prefs = Modular.get<Preferences>();
    final size = MediaQuery.of(context).size;
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
                SvgPicture.network(
                  YuGiOhUiValues.siiLogo,
                  height: size.height * 0.2,
                  width: size.width * 0.2,
                  colorFilter: const ColorFilter.mode(
                    Colors.blue,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
