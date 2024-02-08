import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protiendas/app/screen/init/bloc/bloc.dart' as bloc;
import 'package:protiendas/app/screen/init/repository.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/config/client_config.dart';
import 'package:protiendas/app/utils/http/http_client.dart';
import 'package:protiendas/app/utils/http/token.dart';
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
    final xigoHttpClient = Modular.get<XigoHttpClient>();
    return Scaffold(
      backgroundColor: ProTiendasUiColors.backgroundColor,
      body: BlocProvider(
        create: (context) => bloc.Bloc(
          repository: Repository(
            xigoHttpClient: xigoHttpClient,
          ),
          app: app,
          prefs: prefs,
          tokenRepository: TokenRepository(),
          httpClient: xigoHttpClient,
        )..add(bloc.InitEvent()),
        child: BlocListener<bloc.Bloc, bloc.State>(
          listener: listener,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ProTiendasUiValues.acacomproLogo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
