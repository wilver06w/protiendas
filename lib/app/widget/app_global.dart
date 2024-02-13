import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/navigation.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';

class AppBarGlobal extends StatelessWidget implements PreferredSizeWidget {
  const AppBarGlobal({
    super.key,
    this.icon = const Icon(
      Icons.arrow_back_ios_new_outlined,
      color: ProTiendasUiColors.secondaryColor,
      size: 20,
    ),
    this.onTapIcon,
    this.haveSearch = true,
    this.title = '',
    this.havCart = true,
    this.havIconLeft = true,
  });

  final Widget icon;
  final VoidCallback? onTapIcon;
  final bool haveSearch;
  final String title;
  final bool havCart;
  final bool havIconLeft;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65,
      backgroundColor: ProTiendasUiColors.primaryColor,
      title: Center(
        child: haveSearch
            ? Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  border: const Border(
                    left: BorderSide(
                      color: ProTiendasUiColors.secondaryColor,
                      width: 3,
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(YuGiOhSpacing.sl),
                child: XigoTextMedium(
                  ProTiendasUiValues.searchProtiendas,
                ))
            : XigoTextLarge(
                title,
                color: ProTiendasUiColors.white,
                weight: FontWeight.w300,
              ),
      ),
      actions: [
        if (havCart) ...[
          InkWell(
            onTap: () {
              YuGiOhRoute.navCart();
            },
            child: SvgPicture.asset(
              ProTiendasUiValues.icCart,
            ),
          ),
          const Gap(YuGiOhSpacing.md),
        ]
      ],
      leading: havIconLeft
          ? InkWell(
              onTap: onTapIcon,
              child: icon,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
