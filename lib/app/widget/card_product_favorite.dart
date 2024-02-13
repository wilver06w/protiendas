import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/app/screen/detail/page.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';
import 'package:protiendas/app/widget/imagen_widget.dart';

class CardProductFavorite extends StatelessWidget {
  const CardProductFavorite({
    super.key,
    required this.image,
    required this.title,
    required this.priceBefore,
    required this.price,
    required this.titleFeatures,
    required this.descriptionFeature,
    this.widthImage = 150,
    this.heightImage = 120,
  });
  final String image;
  final String title;
  final String priceBefore;
  final String price;
  final String titleFeatures;
  final String descriptionFeature;

  final double widthImage;
  final double heightImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(YuGiOhSpacing.md),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ProTiendasUiColors.lightSilver,
                        width: 1,
                      ),
                    ),
                    child: Hero(
                      tag: image,
                      child: ImagenWidget(
                        image: image,
                        height: heightImage,
                        width: widthImage,
                      ),
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
                      const Gap(YuGiOhSpacing.md),
                      ItemDescription(
                        title: titleFeatures,
                        description: descriptionFeature,
                      ),
                    ],
                  ),
                ],
              ),
              SvgPicture.asset(
                ProTiendasUiValues.icDelete,
                height: 20,
                width: 20,
              ),
            ],
          ),
          const Gap(YuGiOhSpacing.md),
          const Divider(
            thickness: 0.5,
            color: ProTiendasUiColors.silverFoil,
            indent: 0,
          ),
        ],
      ),
    );
  }
}
