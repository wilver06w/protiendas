import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';

class CardProductHorizontal extends StatelessWidget {
  const CardProductHorizontal({
    super.key,
    required this.image,
    required this.title,
    required this.priceBefore,
    required this.price,
    required this.desct,
    required this.isFreeSend,
  });

  final String image;
  final String title;
  final String priceBefore;
  final String price;
  final String desct;
  final bool isFreeSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 3,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              ProTiendasUiValues.iconHeartSvg,
              height: 20,
              width: 30,
            ),
            Hero(
              tag: image,
              child: Image.network(
                image,
                height: 120,
                width: 150,
              ),
            ),
            const Gap(YuGiOhSpacing.sl),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                XigoTextMedium(
                  title,
                  color: ProTiendasUiColors.primaryColor,
                  weight: FontWeight.w600,
                ),
                const Gap(YuGiOhSpacing.sm),
                XigoTextMedium(
                  price,
                  color: ProTiendasUiColors.primaryColor,
                  weight: FontWeight.w500,
                ),
                const Gap(YuGiOhSpacing.sm),
                if (isFreeSend) ...[
                  const Gap(YuGiOhSpacing.sm),
                  XigoTextMedium(
                    ProTiendasUiValues.sendFree,
                    color: ProTiendasUiColors.secondaryColor,
                    weight: FontWeight.w500,
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
