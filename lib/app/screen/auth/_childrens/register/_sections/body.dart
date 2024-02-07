part of 'package:protiendas/app/screen/auth/_childrens/register/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKeyLogin = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        const Gap(YuGiOhSpacing.md),
        XigoText.body(
          label: ProTiendasUiValues.welcome,
          color: Colors.black,
          textStyle: GoogleFonts.lato(),
        ),
        const Gap(YuGiOhSpacing.sl),
        XigoText.small(
          label: ProTiendasUiValues.register,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: YuGiOhSpacing.md),
          child: BlocBuilder<BlocRegister, RegisterState>(
            builder: (context, state) {
              bool isFormValidate = state.model.isFormFilledLogin;
              return XigoBtnPrimary(
                backgroundColor: ProTiendasUiColors.primaryColor,
                onTap: isFormValidate
                    ? () {
                        final formState = formKeyLogin.currentState;

                        if (isFormValidate && (formState?.validate() ?? true)) {
                          context.read<BlocRegister>().add(SendRegisterEvent());
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
                label: ProTiendasUiValues.save,
              );
            },
          ),
        ),
      ],
    );
  }
}
