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
                XigoText.body(
                  label: item.desc,
                  textStyle: GoogleFonts.lato(),
                ),
                const Gap(YuGiOhSpacing.md),
                XigoText.body(
                  label: ProTiendasUiValues.atribute,
                  textStyle: GoogleFonts.lato(),
                ),
                const Gap(YuGiOhSpacing.sm),
                Wrap(
                  spacing: YuGiOhSpacing.xs,
                  children: [
                    ItemDetailCard(
                      title: ProTiendasUiValues.type,
                      desc: item.type,
                    ),
                    ItemDetailCard(
                      title: ProTiendasUiValues.archetype,
                      desc: item.archetype ?? '',
                    ),
                    ItemDetailCard(
                      title: ProTiendasUiValues.atk,
                      desc: '${item.atk ?? 0}',
                    ),
                    ItemDetailCard(
                      title: ProTiendasUiValues.def,
                      desc: '${item.def ?? 0}',
                    ),
                    ItemDetailCard(
                      title: ProTiendasUiValues.level,
                      desc: '${item.level ?? 0}',
                    ),
                    ItemDetailCard(
                      title: ProTiendasUiValues.race,
                      desc: item.race,
                    ),
                    ItemDetailCard(
                      title: ProTiendasUiValues.atribute,
                      desc: item.attribute ?? '',
                    ),
                  ],
                ),
                const Gap(YuGiOhSpacing.md),
                XigoText.body(
                  label: ProTiendasUiValues.prices,
                  textStyle: GoogleFonts.lato(),
                ),
                const Gap(YuGiOhSpacing.sm),
                Wrap(
                  spacing: YuGiOhSpacing.xs,
                  children: [
                    ItemDetailCard(
                      title: ProTiendasUiValues.cardMarket,
                      desc: itemCardPrices?.cardmarketPrice ?? '',
                    ),
                    ItemDetailCard(
                      title: ProTiendasUiValues.tcgPlayer,
                      desc: itemCardPrices?.tcgplayerPrice ?? '',
                    ),
                    ItemDetailCard(
                      title: ProTiendasUiValues.ebayPrice,
                      desc: itemCardPrices?.ebayPrice ?? '',
                    ),
                    ItemDetailCard(
                      title: ProTiendasUiValues.amazon,
                      desc: itemCardPrices?.amazonPrice ?? '',
                    ),
                    ItemDetailCard(
                      title: ProTiendasUiValues.coolStuffinc,
                      desc: itemCardPrices?.coolstuffincPrice ?? '',
                    ),
                  ],
                ),
                const Gap(YuGiOhSpacing.md),
                Center(
                  child: Button(
                    title: ProTiendasUiValues.seeMore,
                    backgroundColor: ProTiendasUiColors.primaryColor,
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
