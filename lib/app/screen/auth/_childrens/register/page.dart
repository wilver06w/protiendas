import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:protiendas/app/screen/auth/_childrens/register/bloc/bloc.dart';
import 'package:protiendas/app/screen/auth/_childrens/register/repository.dart';
import 'package:protiendas/app/utils/button/btn.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/config/client_config.dart';
import 'package:protiendas/app/utils/http/http_client.dart'
    hide ModularWatchExtension;
import 'package:protiendas/app/utils/input/input.dart';
import 'package:protiendas/app/utils/loading.dart';
import 'package:protiendas/app/utils/navigation.dart';
import 'package:protiendas/app/utils/preferences.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/validations_inputs.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';

part 'package:protiendas/app/screen/auth/_childrens/register/_sections/body.dart';
part 'package:protiendas/app/screen/auth/_childrens/register/_sections/bottom.dart';
part 'package:protiendas/app/screen/auth/_childrens/register/_sections/form_login.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return BlocProvider<BlocRegister>(
      create: (context) => BlocRegister(
        prefs: Modular.get<Preferences>(),
        repository: Repository(
          xigoHttpClient: Modular.get<XigoHttpClient>(),
        ),
        appConfig: app,
        httpClient: Modular.get<XigoHttpClient>(),
      ),
      child: BlocListener<BlocRegister, RegisterState>(
        listener: _listener,
        child: Scaffold(
          backgroundColor: ProTiendasUiColors.backgroundColor,
          bottomNavigationBar: BodyBottom(app: app),
          body: const SafeArea(
            child: Body(),
          ),
        ),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, RegisterState state) async {
  if (state is LoadingRegisterState) {
    YuGiOhLoading.show(context);
  } else if (state is LoadedRegisterState) {
    Navigator.pop(context);
    showToast(
      '${state.model.dataLogin?.message ?? ''}\n${ProTiendasUiValues.nowYouCanLogIn}',
      backgroundColor: ProTiendasUiColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
      duration: const Duration(seconds: 10),
    );
    YuGiOhRoute.navHome();
  } else if (state is ErrorRegisterState) {
    Navigator.pop(context);
  }
}
