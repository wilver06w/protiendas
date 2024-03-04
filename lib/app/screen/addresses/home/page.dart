import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/navigation.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/protiendas_ui.dart';
import 'package:protiendas/app/widget/app_global.dart';
import 'package:protiendas/app/widget/container_circle_color.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarGlobal(
        onTapIcon: () {
          Modular.to.pop();
        },
        haveSearch: false,
        havCart: false,
        title: ProTiendasUiValues.delivery,
      ),
      body: ListView(
        padding: const EdgeInsets.all(YuGiOhSpacing.lg),
        children: [
          XigoTextHeading6(
            ProTiendasUiValues.chooseDeliveryMethod,
            weight: FontWeight.w500,
          ),
          const Gap(YuGiOhSpacing.lg),
          ContainerCircleColor(
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          ProTiendasUiValues.circleGrey,
                        ),
                        const Gap(YuGiOhSpacing.sm),
                        XigoTextLarge(
                          ProTiendasUiValues.sendHome,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    XigoTextSmall(
                      ProTiendasUiValues.sendFree,
                      color: ProTiendasUiColors.crayolaGreen,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                const Divider(
                  thickness: 0.5,
                  color: ProTiendasUiColors.silverFoil,
                  indent: 0,
                ),
                InkWell(
                  onTap: () {
                    YuGiOhRoute.navAddAddress();
                  },
                  child: Row(
                    children: [
                      const Gap(YuGiOhSpacing.md),
                      XigoTextCaptionS(
                        ProTiendasUiValues.addShippingAddress,
                        color: ProTiendasUiColors.crayolaGreen,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(YuGiOhSpacing.md),
          ContainerCircleColor(
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          ProTiendasUiValues.circleGrey,
                        ),
                        const Gap(YuGiOhSpacing.sm),
                        XigoTextLarge(
                          ProTiendasUiValues.pickUpDeliveryPoint,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    XigoTextSmall(
                      ProTiendasUiValues.sendFree,
                      color: ProTiendasUiColors.crayolaGreen,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                const Divider(
                  thickness: 0.5,
                  color: ProTiendasUiColors.silverFoil,
                  indent: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: YuGiOhSpacing.sm,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            ProTiendasUiValues.icUbicationDelivery,
                          ),
                          const Gap(YuGiOhSpacing.sm),
                          XigoTextCaptionS(
                            ProTiendasUiValues.addressOffice,
                            color: ProTiendasUiColors.primaryColor,
                            weight: FontWeight.w300,
                          ),
                        ],
                      ),
                      const Gap(YuGiOhSpacing.sm),
                      Row(
                        children: [
                          SvgPicture.asset(
                            ProTiendasUiValues.icTimeDelivery,
                          ),
                          const Gap(YuGiOhSpacing.sm),
                          XigoTextCaptionS(
                            ProTiendasUiValues.officeHours,
                            color: ProTiendasUiColors.silverFoil,
                            weight: FontWeight.w300,
                          ),
                        ],
                      ),
                      const Gap(YuGiOhSpacing.sm),
                      XigoTextCaptionS(
                        ProTiendasUiValues.viewMapChooseAnotherCollectionPoint,
                        color: ProTiendasUiColors.crayolaGreen,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
