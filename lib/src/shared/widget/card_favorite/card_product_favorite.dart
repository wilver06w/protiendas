import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/constant/spacing.dart';
import 'package:protiendas/src/core/utils/helpers/text/text.dart';
import 'package:protiendas/src/core/utils/constant/protienda_ui.dart';
import 'package:protiendas/src/shared/widget/card_favorite/bloc/bloc.dart';
import 'package:protiendas/src/shared/widget/imagen_widget.dart';
import 'package:protiendas/src/shared/widget/item_description.dart';

class CardProductFavorite extends StatelessWidget {
  const CardProductFavorite({
    super.key,
    required this.image,
    required this.title,
    required this.priceBefore,
    required this.price,
    required this.titleFeatures,
    required this.descriptionFeature,
    required this.quantity,
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
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocCardFavorite(quantity: quantity),
      child: BlocListener<BlocCardFavorite, CardFavoriteState>(
        listener: (context, state) {
          if (state is ChangedQuantityState) {}
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(ProTiendaSpacing.md),
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
                      const Gap(ProTiendaSpacing.sl),
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
                          const Gap(ProTiendaSpacing.sm),
                          XigoTextMedium(
                            price,
                            color: ProTiendasUiColors.primaryColor,
                            weight: FontWeight.w500,
                          ),
                          const Gap(ProTiendaSpacing.md),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ItemDescription(
                                title: titleFeatures,
                                description: descriptionFeature,
                              ),
                              const Gap(ProTiendaSpacing.xl),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: ProTiendasUiColors.lightSilver,
                                    width: 1,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: ProTiendaSpacing.sl,
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
                    onTap: () {},
                    child: SvgPicture.asset(
                      ProTiendasUiValues.icDelete,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              ),
              const Gap(ProTiendaSpacing.md),
              const Divider(
                thickness: 0.5,
                color: ProTiendasUiColors.silverFoil,
                indent: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
