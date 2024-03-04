part of 'package:protiendas/src/features/auth/_childrens/login/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKeyLogin = GlobalKey<FormState>();
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: ProTiendaSpacing.md,
        vertical: ProTiendaSpacing.md,
      ),
      children: [
        const Gap(ProTiendaSpacing.xxl),
        XigoTextXl(
          ProTiendasUiValues.enterEmailUsername,
          color: Colors.black,
        ),
        const Gap(ProTiendaSpacing.xxl),
        FormLogin(
          formKey: formKeyLogin,
        ),
        const Gap(ProTiendaSpacing.sl),
        Center(
          child: XigoTextSmall(
            ProTiendasUiValues.didForgetPassword,
            color: ProTiendasUiColors.secondaryColor,
            weight: FontWeight.w500,
          ),
        ),
        const Gap(ProTiendaSpacing.xxl),
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
        const Gap(ProTiendaSpacing.lg),
        XigoBtnOutline(
          label: ProTiendasUiValues.createAccount,
          borderColor: ProTiendasUiColors.secondaryColor,
          labelColor: ProTiendasUiColors.secondaryColor,
          btnSize: XigoBtnSize.big,
          onTap: () {
            ProTiendasRoute.navRegister();
          },
        ),
        const Gap(ProTiendaSpacing.xxl),
        const Footer(),
      ],
    );
  }
}
