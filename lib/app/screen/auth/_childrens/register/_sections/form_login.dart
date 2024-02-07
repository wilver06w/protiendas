part of 'package:protiendas/app/screen/auth/_childrens/register/page.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XigoTextField(
            controller: null,
            hintText: ProTiendasUiValues.name,
            title: ProTiendasUiValues.name,
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${ProTiendasUiValues.name} ${ProTiendasUiValues.onRequired}';
              }
              return null;
            },
            onChanged: (value) {
              context.read<BlocRegister>().add(
                    ChangeNameEvent(
                      name: value,
                    ),
                  );
            },
          ),
          const Gap(YuGiOhSpacing.md),
          XigoTextField(
            controller: null,
            hintText: ProTiendasUiValues.lastName,
            title: ProTiendasUiValues.lastName,
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${ProTiendasUiValues.lastName} ${ProTiendasUiValues.onRequired}';
              }
              return null;
            },
            onChanged: (value) {
              context.read<BlocRegister>().add(
                    ChangeLastNameEvent(
                      lastName: value,
                    ),
                  );
            },
          ),
          const Gap(YuGiOhSpacing.md),
          XigoTextField(
            controller: null,
            hintText: ProTiendasUiValues.email,
            title: ProTiendasUiValues.email,
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              return Validate.email(value as String)
                  ? null
                  : ProTiendasUiValues.verifyEmail;
            },
            onChanged: (value) {
              context.read<BlocRegister>().add(
                    ChangeEmailEvent(
                      email: value,
                    ),
                  );
            },
          ),
          const Gap(YuGiOhSpacing.md),
          BlocBuilder<BlocRegister, RegisterState>(
            builder: (context, state) {
              final controllers = TextEditingController(
                text: state.model.password,
              );

              return XigoObscureInput(
                controller: controllers
                  ..selection = TextSelection.fromPosition(
                    TextPosition(
                      offset: controllers.text.length,
                    ),
                  ),
                hintText: ProTiendasUiValues.password,
                title: ProTiendasUiValues.password,
                fillColor: Colors.white,
                filled: true,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return '${ProTiendasUiValues.password} ${ProTiendasUiValues.onRequired}';
                  }
                  return null;
                },
                onChanged: (value) {
                  context.read<BlocRegister>().add(
                        ChangePasswordEvent(
                          password: value,
                        ),
                      );
                },
              );
            },
          ),
          const Gap(YuGiOhSpacing.md),
        ],
      ),
    );
  }
}
