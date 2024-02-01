part of 'package:protiendas/app/screen/detail/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      padding: const EdgeInsets.all(YuGiOhSpacing.md),
      children: [
        const Gap(YuGiOhSpacing.md),
        const Header(),
        const Gap(YuGiOhSpacing.md),
        BlocBuilder<BlocDetail, DetailState>(
          builder: (context, state) {
            final item = state.model.itemYugiOh;
            final itemCardPrices = state.model.itemYugiOh.cardPrices?[0];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    FullscreenImageViewer.open(
                      context: context,
                      child: Hero(
                        tag: item.cardImages?[0].imageUrlCropped ?? '',
                        child: Image.network(
                          item.cardImages?[0].imageUrl ?? '',
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Hero(
                      tag: item.cardImages?[0].imageUrlCropped ?? '',
                      child: Image.network(
                        item.cardImages?[0].imageUrl ?? '',
                        height: size.height * 0.5,
                        width: size.width * 0.6,
                      ),
                    ),
                  ),
                ),
                YuGiOhText.body(
                  label: item.desc,
                  textStyle: GoogleFonts.lato(),
                ),
                const Gap(YuGiOhSpacing.md),
                YuGiOhText.body(
                  label: YuGiOhUiValues.atribute,
                  textStyle: GoogleFonts.lato(),
                ),
                const Gap(YuGiOhSpacing.sm),
                Wrap(
                  spacing: YuGiOhSpacing.xs,
                  children: [
                    ItemDetailCard(
                      title: YuGiOhUiValues.type,
                      desc: item.type,
                    ),
                    ItemDetailCard(
                      title: YuGiOhUiValues.archetype,
                      desc: item.archetype ?? '',
                    ),
                    ItemDetailCard(
                      title: YuGiOhUiValues.atk,
                      desc: '${item.atk ?? 0}',
                    ),
                    ItemDetailCard(
                      title: YuGiOhUiValues.def,
                      desc: '${item.def ?? 0}',
                    ),
                    ItemDetailCard(
                      title: YuGiOhUiValues.level,
                      desc: '${item.level ?? 0}',
                    ),
                    ItemDetailCard(
                      title: YuGiOhUiValues.race,
                      desc: item.race,
                    ),
                    ItemDetailCard(
                      title: YuGiOhUiValues.atribute,
                      desc: item.attribute ?? '',
                    ),
                  ],
                ),
                const Gap(YuGiOhSpacing.md),
                YuGiOhText.body(
                  label: YuGiOhUiValues.prices,
                  textStyle: GoogleFonts.lato(),
                ),
                const Gap(YuGiOhSpacing.sm),
                Wrap(
                  spacing: YuGiOhSpacing.xs,
                  children: [
                    ItemDetailCard(
                      title: YuGiOhUiValues.cardMarket,
                      desc: itemCardPrices?.cardmarketPrice ?? '',
                    ),
                    ItemDetailCard(
                      title: YuGiOhUiValues.tcgPlayer,
                      desc: itemCardPrices?.tcgplayerPrice ?? '',
                    ),
                    ItemDetailCard(
                      title: YuGiOhUiValues.ebayPrice,
                      desc: itemCardPrices?.ebayPrice ?? '',
                    ),
                    ItemDetailCard(
                      title: YuGiOhUiValues.amazon,
                      desc: itemCardPrices?.amazonPrice ?? '',
                    ),
                    ItemDetailCard(
                      title: YuGiOhUiValues.coolStuffinc,
                      desc: itemCardPrices?.coolstuffincPrice ?? '',
                    ),
                  ],
                ),
                const Gap(YuGiOhSpacing.md),
                Center(
                  child: Button(
                    title: YuGiOhUiValues.seeMore,
                    backgroundColor: YuGiOhColors.primaryColor,
                    onPressed: () {
                      Functions.launchInBrowser(
                        url: item.ygoprodeckUrl,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
