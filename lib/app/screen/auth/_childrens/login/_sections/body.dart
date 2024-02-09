part of 'package:protiendas/app/screen/auth/_childrens/login/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKeyLogin = GlobalKey<FormState>();
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: YuGiOhSpacing.md,
        vertical: YuGiOhSpacing.md,
      ),
      children: [
        const Gap(YuGiOhSpacing.xxl),
        XigoTextXl(
          ProTiendasUiValues.enterEmailUsername,
          color: Colors.black,
        ),
        const Gap(YuGiOhSpacing.xxl),
        FormLogin(
          formKey: formKeyLogin,
        ),
        const Gap(YuGiOhSpacing.sl),
        Center(
          child: XigoTextSmall(
            ProTiendasUiValues.didForgetPassword,
            color: ProTiendasUiColors.secondaryColor,
            weight: FontWeight.w500,
          ),
        ),
        const Gap(YuGiOhSpacing.xxl),
        BlocBuilder<BlocLogin, LoginState>(
          builder: (context, state) {
            bool isFormValidate = state.model.isFormFilledLogin;
            return XigoBtnPrimary(
              label: ProTiendasUiValues.continu,
              backgroundColor: ProTiendasUiColors.secondaryColor,
              btnSize: XigoBtnSize.big,
              labelColor: ProTiendasUiColors.primaryColor,
              onTap: isFormValidate
                  ? () {
                      final formState = formKeyLogin.currentState;

                      if (isFormValidate && (formState?.validate() ?? true)) {
                        context.read<BlocLogin>().add(SendLoginEvent());
                      } else {
                        showToast(
                          ProTiendasUiValues.completeTheData,
                          backgroundColor: ProTiendasUiColors.rybBlue,
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        );
                        return;
                      }
                    }
                  : null,
            );
          },
        ),
        const Gap(YuGiOhSpacing.lg),
        XigoBtnOutline(
          label: ProTiendasUiValues.createAccount,
          borderColor: ProTiendasUiColors.secondaryColor,
          labelColor: ProTiendasUiColors.secondaryColor,
          btnSize: XigoBtnSize.big,
          onTap: () {
            YuGiOhRoute.navRegister();
          },
        ),
        const Gap(YuGiOhSpacing.xxl),
        const Footer(),
      ],
    );
  }
}
