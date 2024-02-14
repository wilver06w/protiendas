part of 'package:protiendas/app/screen/payment_method/add/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formDataTarjet = GlobalKey<FormState>();
    return ListView(
      padding: const EdgeInsets.all(YuGiOhSpacing.lg),
      children: [
        const Gap(YuGiOhSpacing.lg),
        Image.asset(
          ProTiendasUiValues.icBackgroundTarjet,
        ),
        const Gap(YuGiOhSpacing.lg),
        FormDataTarjet(formKey: formDataTarjet),
        SwitchListTile(
          value: true,
          activeColor: ProTiendasUiColors.primaryColor,
          title: XigoTextCaptionS(
            ProTiendasUiValues.saveShippingAddress,
            color: ProTiendasUiColors.primaryColor,
            weight: FontWeight.w300,
          ),
          onChanged: (value) {},
        ),
        const Gap(YuGiOhSpacing.xxl),
        XigoBtnPrimary(
          label: ProTiendasUiValues.saveConfirm,
          backgroundColor: ProTiendasUiColors.secondaryColor,
          btnSize: XigoBtnSize.big,
          labelColor: ProTiendasUiColors.primaryColor,
          onTap: () {},
        ),
      ],
    );
  }
}
