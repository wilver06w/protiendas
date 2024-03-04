import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/app/screen/detail/page.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/protiendas_ui.dart';
import 'package:protiendas/app/widget/card_favorite/bloc/bloc.dart';
import 'package:protiendas/app/widget/imagen_widget.dart';

class CardProductCart extends StatelessWidget {
  const CardProductCart({
    super.key,
    required this.image,
    required this.title,
    required this.priceBefore,
    required this.price,
    required this.titleFeatures,
    required this.descriptionFeature,
    required this.onTapDelete,
    required this.quantity,
    this.widthImage = 150,
    this.heightImage = 120,
    required this.onChangeValue,
  });
  final String image;
  final String title;
  final String priceBefore;
  final String price;
  final String titleFeatures;
  final String descriptionFeature;

  final double widthImage;
  final double heightImage;
  final int quantity;
  final VoidCallback onTapDelete;
  final Function(int) onChangeValue;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocCardFavorite(quantity: quantity),
      child: BlocListener<BlocCardFavorite, CardFavoriteState>(
        listener: (context, state) {
          if (state is ChangedQuantityState) {
            onChangeValue(state.model.quantity);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: const EdgeInsets.all(YuGiOhSpacing.md),
          child: Row(
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
                    mainAxisSize: MainAxisSize.max,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemDescription(
                            title: titleFeatures,
                            description: descriptionFeature,
                          ),
                          const Gap(YuGiOhSpacing.xl),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: ProTiendasUiColors.lightSilver,
                                width: 1,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: YuGiOhSpacing.sl,
                            ),
                            child: BlocBuilder<BlocCardFavorite,
                                CardFavoriteState>(
                              builder: (context, state) {
                                return DropdownButton<int>(
                                  value: state.model.quantity,
                                  items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                                      .map(
                                        (item) => DropdownMenuItem(
                                          value: item,
                                          child: XigoTextMedium(
                                            '$item',
                                            weight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    context.read<BlocCardFavorite>().add(
                                          OnChangeQuantityEvent(
                                            quantity: value ?? 1,
                                          ),
                                        );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: onTapDelete,
                child: SvgPicture.asset(
                  ProTiendasUiValues.icDelete,
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
