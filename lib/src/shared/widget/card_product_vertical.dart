import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/constant/spacing.dart';
import 'package:protiendas/src/core/utils/helpers/text/text.dart';
import 'package:protiendas/src/core/utils/constant/protienda_ui.dart';

class CardProductVertical extends StatelessWidget {
  const CardProductVertical({
    super.key,
    required this.image,
    required this.title,
    required this.priceBefore,
    required this.price,
    required this.desct,
    required this.isFreeSend,
    this.isFavorite = false,
  });

  final String image;
  final String title;
  final String priceBefore;
  final String price;
  final String desct;
  final bool isFreeSend;
  final bool isFavorite;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              isFavorite
                  ? ProTiendasUiValues.iconHeartSvg
                  : ProTiendasUiValues.icHeartNoSelected,
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
            const Gap(ProTiendaSpacing.sl),
            XigoTextMedium(
              title,
              color: ProTiendasUiColors.primaryColor,
              weight: FontWeight.w600,
            ),
            const Gap(ProTiendaSpacing.sm),
            XigoTextSmall(
              priceBefore,
              color: ProTiendasUiColors.silverFoil,
            ),
            const Gap(ProTiendaSpacing.sm),
            Row(
              children: [
                XigoTextXl(
                  price,
                  color: ProTiendasUiColors.primaryColor,
                ),
                const Gap(ProTiendaSpacing.sm),
                XigoTextXl(
                  desct,
                  color: ProTiendasUiColors.secondaryColor,
                ),
              ],
            ),
            if (isFreeSend) ...[
              const Gap(ProTiendaSpacing.sm),
              XigoTextSmall(
                ProTiendasUiValues.sendFree,
                color: ProTiendasUiColors.secondaryColor,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
