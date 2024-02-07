part of 'package:protiendas/app/screen/auth/_childrens/login/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKeyLogin = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Gap(YuGiOhSpacing.md),
        XigoText.body(
          label: ProTiendasUiValues.welcome,
          color: Colors.black,
          textStyle: GoogleFonts.lato(),
        ),
        const Gap(YuGiOhSpacing.md),
        Image.asset(
          ProTiendasUiValues.acacomproLogo,
          height: size.height * 0.1,
          width: size.width * 0.1,
        ),
        const Gap(YuGiOhSpacing.md),
        Padding(
          padding: const EdgeInsets.all(YuGiOhSpacing.md),
          child: FormLogin(
            formKey: formKeyLogin,
          ),
        ),
        BlocBuilder<BlocLogin, LoginState>(
          builder: (context, state) {
            bool isFormValidate = state.model.isFormFilledLogin;
            return XigoBtnPrimary(
              label: ProTiendasUiValues.sigIn,
              backgroundColor: ProTiendasUiColors.primaryColor,
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
        const Gap(YuGiOhSpacing.xxl),
        InkWell(
          onTap: () {
            YuGiOhRoute.navRegister();
          },
          child: XigoText.title(
            label: ProTiendasUiValues.register,
            textStyle: GoogleFonts.lato(),
          ),
        ),
      ],
    );
  }
}
