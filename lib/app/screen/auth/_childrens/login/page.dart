import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:protiendas/app/screen/auth/_childrens/login/bloc/bloc.dart';
import 'package:protiendas/app/screen/auth/_childrens/login/repository.dart';
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
import 'package:protiendas/app/widget/item_sigin_register.dart';

part 'package:protiendas/app/screen/auth/_childrens/login/_sections/body.dart';
part 'package:protiendas/app/screen/auth/_childrens/login/_sections/bottom.dart';
part 'package:protiendas/app/screen/auth/_childrens/login/_sections/form_login.dart';
part 'package:protiendas/app/screen/auth/_childrens/login/_sections/footer.dart';

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
                const Gap(YuGiOhSpacing.md),
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
    YuGiOhRoute.navHome();
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
