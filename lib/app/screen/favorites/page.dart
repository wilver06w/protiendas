import 'package:flutter/material.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';
import 'package:protiendas/app/widget/app_global.dart';
import 'package:protiendas/app/widget/card_product_favorite.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGlobal(
        onTapIcon: () {},
        haveSearch: false,
        title: ProTiendasUiValues.favorites,
      ),
      body: ListView(
        children: [
          ...List.generate(
            3,
            (index) => const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: YuGiOhSpacing.sl,
                vertical: YuGiOhSpacing.sm,
              ),
              child: CardProductFavorite(
                priceBefore: '\$480.000',
                price: '\$450.000',
                titleFeatures: 'Color',
                descriptionFeature: 'Arena',
                image:
                    'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
                title: 'Smart Watch para Android/iOS',
                widthImage: 100,
                heightImage: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
