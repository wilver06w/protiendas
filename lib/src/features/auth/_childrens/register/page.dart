import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:oktoast/oktoast.dart';
import 'package:protiendas/src/features/auth/_childrens/register/bloc/bloc.dart';
import 'package:protiendas/src/features/auth/_childrens/register/repository.dart';
import 'package:protiendas/src/shared/widget/button/btn.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/config/client_config.dart';
import 'package:protiendas/src/core/network/http_client.dart'
    hide ModularWatchExtension;
import 'package:protiendas/src/core/utils/helpers/input/input.dart';
import 'package:protiendas/src/core/utils/loading.dart';
import 'package:protiendas/src/core/utils/constant/navigation.dart';
import 'package:protiendas/src/core/utils/preferences.dart';
import 'package:protiendas/src/core/utils/constant/spacing.dart';
import 'package:protiendas/src/core/utils/helpers/text/text.dart';
import 'package:protiendas/src/core/utils/helpers/validations_inputs.dart';
import 'package:protiendas/src/core/utils/constant/protienda_ui.dart';
import 'package:protiendas/src/shared/widget/item_sigin_register.dart';

part 'package:protiendas/src/features/auth/_childrens/register/_sections/body.dart';
part 'package:protiendas/src/features/auth/_childrens/register/_sections/footer.dart';
part 'package:protiendas/src/features/auth/_childrens/register/_sections/form_register.dart';

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
                  ProTiendasUiValues.createAccount,
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
      state.model.dataLogin?.message ?? '',
      backgroundColor: ProTiendasUiColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
      duration: const Duration(seconds: 10),
    );
    ProTiendasRoute.navDashboard();
  } else if (state is ErrorRegisterState) {
    Navigator.pop(context);
  }
}
