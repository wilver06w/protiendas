import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/app/utils/button/btn.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/config/client_config.dart';
import 'package:protiendas/app/utils/input/input.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';
import 'package:protiendas/app/widget/app_global.dart';
import 'package:protiendas/app/widget/container_circle_color.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
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
            ProTiendasUiValues.shippingAddress,
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
                        Image.asset(
                          ProTiendasUiValues.icCheck,
                        ),
                        const Gap(YuGiOhSpacing.sm),
                        XigoTextLarge(
                          ProTiendasUiValues.yourData,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ProTiendasUiValues.icEdit,
                        ),
                        const Gap(YuGiOhSpacing.xs),
                        XigoTextSmall(
                          ProTiendasUiValues.editData,
                          color: ProTiendasUiColors.crayolaGreen,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(YuGiOhSpacing.xs),
                XigoTextLarge(
                  '${app.clien?.nombre} ${app.clien?.apellido}',
                  color: ProTiendasUiColors.primaryColor,
                  weight: FontWeight.w300,
                ),
                const Gap(YuGiOhSpacing.xs),
                XigoTextLarge(
                  app.clien?.correo ?? '',
                  color: ProTiendasUiColors.primaryColor,
                  weight: FontWeight.w300,
                ),
                const Gap(YuGiOhSpacing.xs),
                XigoTextLarge(
                  '${app.country.prefix} ${app.clien?.telefono ?? ''}',
                  color: ProTiendasUiColors.primaryColor,
                  weight: FontWeight.w300,
                ),
              ],
            ),
          ),
          const Gap(YuGiOhSpacing.md),
          Row(
            children: [
              ContainerCircleColor(
                padding: const EdgeInsets.symmetric(
                  horizontal: YuGiOhSpacing.sl,
                  vertical: YuGiOhSpacing.xs,
                ),
                widget: DropdownButton<String>(
                  hint: XigoTextMedium(
                    ProTiendasUiValues.type,
                    weight: FontWeight.w500,
                  ),
                  style: null,
                  items: ProTiendasUiValues.addressList
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: XigoTextMedium(
                            item,
                            weight: FontWeight.w500,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                ),
              ),
              const Gap(YuGiOhSpacing.md),
              Expanded(
                child: XigoTextField(
                  controller: null,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      15,
                    ),
                  ),
                  hintText: ProTiendasUiValues.number,
                  fillColor: Colors.white,
                  filled: true,
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return '${ProTiendasUiValues.number} ${ProTiendasUiValues.onRequired}';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          const Gap(YuGiOhSpacing.sl),
          ContainerCircleColor(
            padding: const EdgeInsets.symmetric(
              horizontal: YuGiOhSpacing.sl,
            ),
            widget: DropdownButton<String>(
              hint: XigoTextMedium(
                ProTiendasUiValues.department,
                weight: FontWeight.w500,
              ),
              style: null,
              items: ProTiendasUiValues.addressList
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: XigoTextMedium(
                        item,
                        weight: FontWeight.w500,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {},
            ),
          ),
          const Gap(YuGiOhSpacing.sl),
          ContainerCircleColor(
            padding: const EdgeInsets.symmetric(
              horizontal: YuGiOhSpacing.sl,
            ),
            widget: DropdownButton<String>(
              hint: XigoTextMedium(
                ProTiendasUiValues.city,
                weight: FontWeight.w500,
              ),
              style: null,
              items: ProTiendasUiValues.addressList
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: XigoTextMedium(
                        item,
                        weight: FontWeight.w500,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {},
            ),
          ),
          const Gap(YuGiOhSpacing.sl),
          XigoTextField(
            controller: null,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
            hintText: ProTiendasUiValues.addressBuildingApartment,
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${ProTiendasUiValues.addressBuildingApartment} ${ProTiendasUiValues.onRequired}';
              }
              return null;
            },
            onChanged: (value) {},
          ),
          const Gap(YuGiOhSpacing.sl),
          XigoTextField(
            controller: null,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
            hintText: ProTiendasUiValues.neighborhood,
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${ProTiendasUiValues.neighborhood} ${ProTiendasUiValues.onRequired}';
              }
              return null;
            },
            onChanged: (value) {},
          ),
          const Gap(YuGiOhSpacing.sl),
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
          XigoTextCaptionS(
            ProTiendasUiValues.billingInformation,
            weight: FontWeight.w400,
          ),
          XigoTextSmall(
            ProTiendasUiValues.whatInformationShouldAppearInvoice,
            weight: FontWeight.w300,
          ),
          const Gap(YuGiOhSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ContainerCircleColor(
                  widget: XigoTextCaptionS(
                    ProTiendasUiValues.theSameShippingInformation,
                    weight: FontWeight.w300,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Gap(YuGiOhSpacing.md),
              Expanded(
                child: ContainerCircleColor(
                  widget: XigoTextCaptionS(
                    ProTiendasUiValues.theDataAnotherPersonCompany,
                    weight: FontWeight.w300,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          const Gap(YuGiOhSpacing.md),
          XigoBtnPrimary(
            label: ProTiendasUiValues.continu,
            backgroundColor: ProTiendasUiColors.secondaryColor,
            btnSize: XigoBtnSize.big,
            labelColor: ProTiendasUiColors.primaryColor,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
