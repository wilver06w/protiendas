part of 'package:protiendas/app/screen/auth/_childrens/register/page.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          XigoTextSmall(
            ProTiendasUiValues.loginWith,
            color: Colors.black,
          ),
          const Gap(YuGiOhSpacing.sl),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemSigInRegister(
                icRoute: ProTiendasUiValues.icGoogle,
              ),
              Gap(YuGiOhSpacing.sl),
              ItemSigInRegister(
                icRoute: ProTiendasUiValues.icFacebook,
              ),
              Gap(YuGiOhSpacing.sl),
              ItemSigInRegister(
                icRoute: ProTiendasUiValues.icIos,
              ),
              Gap(YuGiOhSpacing.sl),
              ItemSigInRegister(
                icRoute: ProTiendasUiValues.icMicrosoft,
              ),
            ],
          ),
          const Gap(YuGiOhSpacing.xl),
          XigoTextSmall(
            ProTiendasUiValues.iNeedHelpEnter,
            color: ProTiendasUiColors.secondaryColor,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
