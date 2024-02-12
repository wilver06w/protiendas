import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/app/utils/colors.dart';
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
    required this.onTapIcon,
  });

  final Widget icon;
  final VoidCallback onTapIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65,
      backgroundColor: ProTiendasUiColors.primaryColor,
      title: Center(
        child: Container(
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
          ),
        ),
      ),
      actions: [
        SvgPicture.asset(
          ProTiendasUiValues.iconNotification,
        ),
        const Gap(YuGiOhSpacing.md),
      ],
      leading: InkWell(
        onTap: onTapIcon,
        child: icon,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
