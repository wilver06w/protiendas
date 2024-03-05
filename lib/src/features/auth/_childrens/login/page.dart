import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:protiendas/src/core/network/http_client.dart'
    hide ModularWatchExtension;
import 'package:protiendas/src/core/utils/config/client_config.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/constant/navigation.dart';
import 'package:protiendas/src/core/utils/constant/protienda_ui.dart';
import 'package:protiendas/src/core/utils/constant/spacing.dart';
import 'package:protiendas/src/core/utils/helpers/input/input.dart';
import 'package:protiendas/src/core/utils/helpers/text/text.dart';
import 'package:protiendas/src/core/utils/helpers/validations_inputs.dart';
import 'package:protiendas/src/core/utils/loading.dart';
import 'package:protiendas/src/core/utils/preferences.dart';
import 'package:protiendas/src/features/auth/_childrens/login/bloc/bloc.dart';
import 'package:protiendas/src/features/auth/_childrens/login/repository.dart';
import 'package:protiendas/src/features/init/repository.dart'
    as repository_init;
import 'package:protiendas/src/shared/widget/button/btn.dart';
import 'package:protiendas/src/shared/widget/item_sigin_register.dart';

part 'package:protiendas/src/features/auth/_childrens/login/_sections/body.dart';
part 'package:protiendas/src/features/auth/_childrens/login/_sections/bottom.dart';
part 'package:protiendas/src/features/auth/_childrens/login/_sections/footer.dart';
part 'package:protiendas/src/features/auth/_childrens/login/_sections/form_login.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    final xigoHttp = Modular.get<XigoHttpClient>();
    return BlocProvider<BlocLogin>(
      create: (context) => BlocLogin(
        repository: Repository(
          xigoHttpClient: xigoHttp,
        ),
        repositoryInit: repository_init.Repository(
          xigoHttpClient: xigoHttp,
        ),
        app: app,
        prefs: Modular.get<Preferences>(),
        httpClient: xigoHttp,
      ),
      child: BlocListener<BlocLogin, LoginState>(
        listener: _listener,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 65,
            backgroundColor: ProTiendasUiColors.primaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ProTiendasUiValues.icPersonSvg,
                ),
                const Gap(ProTiendaSpacing.md),
                XigoTextLarge(
                  ProTiendasUiValues.logAccount,
                  color: Colors.white,
                ),
              ],
            ),
            leading: InkWell(
              onTap: () {
                Modular.to.pop();
              },
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: ProTiendasUiColors.secondaryColor,
                size: 20,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: BodyBottom(app: app),
          body: const SafeArea(
            child: Body(),
          ),
        ),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, LoginState state) async {
  if (state is LoadingLoginState) {
    YuGiOhLoading.show(context);
  } else if (state is LoadedLoginState) {
    Navigator.pop(context);
    ProTiendasRoute.navDashboard();
  } else if (state is ErrorLoginState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: ProTiendasUiColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
