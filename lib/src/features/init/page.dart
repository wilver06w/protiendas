import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protiendas/src/features/init/bloc/bloc.dart' as bloc;
import 'package:protiendas/src/features/init/repository.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/config/client_config.dart';
import 'package:protiendas/src/core/network/http_client.dart';
import 'package:protiendas/src/core/network/token.dart';
import 'package:protiendas/src/core/utils/constant/navigation.dart';
import 'package:protiendas/src/core/utils/preferences.dart';
import 'package:protiendas/src/core/utils/constant/protienda_ui.dart';

part 'package:protiendas/src/features/init/listeners/core.dart';

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
