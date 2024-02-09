part of 'package:protiendas/app/screen/auth/_childrens/register/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKeyLogin = GlobalKey<FormState>();
    return ListView(
      padding: const EdgeInsets.all(
        YuGiOhSpacing.md,
      ),
      children: [
        const Gap(YuGiOhSpacing.xl),
        XigoTextCustom(
          ProTiendasUiValues.almostThere,
          color: ProTiendasUiColors.primaryColor,
          fontSize: 22,
        ),
        const Gap(YuGiOhSpacing.sm),
        XigoTextXl(
          ProTiendasUiValues.completeDetailsCreateAccount,
          color: Colors.black,
        ),
        const Gap(YuGiOhSpacing.md),
        FormLogin(
          formKey: formKeyLogin,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: YuGiOhSpacing.md),
          child: BlocBuilder<BlocRegister, RegisterState>(
            builder: (context, state) {
              bool isFormValidate = state.model.isFormFilledLogin;
              return XigoBtnPrimary(
                backgroundColor: ProTiendasUiColors.secondaryColor,
                labelColor: ProTiendasUiColors.primaryColor,
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
                label: ProTiendasUiValues.createAccount,
              );
            },
          ),
        ),
        const Gap(YuGiOhSpacing.xxl),
        const Footer(),
      ],
    );
  }
}
