import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/favorite/bloc/bloc.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/protiendas_ui.dart';

class CardProductVertical extends StatelessWidget {
  const CardProductVertical({
    super.key,
    required this.image,
    required this.title,
    required this.priceBefore,
    required this.price,
    required this.desct,
    required this.isFreeSend,
    required this.id,
  });

  final String image;
  final String title;
  final String priceBefore;
  final String price;
  final String desct;
  final bool isFreeSend;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<BlocFavorite>(),
      child: Container(
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
              BlocBuilder<BlocFavorite, FavoriteState>(
                builder: (context, state) {
                  final isFavorite = state.model.favorites.contains(id);

                  return InkWell(
                    onTap: () {
                      context
                          .read<BlocFavorite>()
                          .add(OnChangeFavoriteEvent(id: id));
                    },
                    child: SvgPicture.asset(
                      isFavorite
                          ? ProTiendasUiValues.iconHeartSvg
                          : ProTiendasUiValues.icHeartNoSelected,
                      height: 20,
                      width: 30,
                    ),
                  );
                },
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
              XigoTextMedium(
                title,
                color: ProTiendasUiColors.primaryColor,
                weight: FontWeight.w600,
              ),
              const Gap(YuGiOhSpacing.sm),
              XigoTextSmall(
                priceBefore,
                color: ProTiendasUiColors.silverFoil,
              ),
              const Gap(YuGiOhSpacing.sm),
              Row(
                children: [
                  XigoTextXl(
                    price,
                    color: ProTiendasUiColors.primaryColor,
                  ),
                  const Gap(YuGiOhSpacing.sm),
                  XigoTextXl(
                    desct,
                    color: ProTiendasUiColors.secondaryColor,
                  ),
                ],
              ),
              if (isFreeSend) ...[
                const Gap(YuGiOhSpacing.sm),
                XigoTextSmall(
                  ProTiendasUiValues.sendFree,
                  color: ProTiendasUiColors.secondaryColor,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
