part of 'package:protiendas/app/screen/home/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<BlocHome, HomeState>(
            builder: (context, state) {
              if (state.model.dataBanner == null) {
                return const SizedBox.shrink();
              }
              return ViewBanner(
                size: size,
                mobile: state.model.dataBanner?.data.mobile ?? [],
              );
            },
          ),
          BlocBuilder<BlocHome, HomeState>(
            builder: (context, state) {
              if (state.model.dataCategoria == null) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                height: 100,
                child: BlocBuilder<BlocHome, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (state.model.dataCategoria?.data ?? []).length,
                      itemBuilder: (context, index) {
                        final item =
                            (state.model.dataCategoria?.data ?? [])[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: YuGiOhSpacing.sm,
                          ),
                          child: Column(
                            children: [
                              const CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                  'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
                                ),
                              ),
                              const Gap(YuGiOhSpacing.sl),
                              XigoTextSmall(
                                item.nombre,
                                color: ProTiendasUiColors.primaryColor,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
          const Gap(YuGiOhSpacing.sl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: YuGiOhSpacing.md),
            child: TitleSections(
              title: ProTiendasUiValues.theNew,
            ),
          ),
          BlocBuilder<BlocHome, HomeState>(
            builder: (context, state) {
              if (state.model.dataBanner == null) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                height: 270,
                child: BlocBuilder<BlocHome, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: YuGiOhSpacing.xxs,
                          ),
                          margin: const EdgeInsets.only(left: YuGiOhSpacing.sl),
                          child: CardProductVertical(
                            id: (index + 30),
                            priceBefore: '\$480.000',
                            price: '\$450.000',
                            desct: '10% Dto',
                            image:
                                'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
                            title:
                                '${ProTiendasUiValues.balonFutbol} ${(index + 30)}',
                            isFreeSend: true,
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 20,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  YuGiOhRoute.navDetail(
                    product: '1',
                  );
                },
                child: const CardImagenGrid(
                  priceBefore: '\$480.000',
                  price: '\$450.000',
                  desct: '10% Dto',
                  image:
                      'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
                  title: ProTiendasUiValues.balonFutbol,
                  isFreeSend: true,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CardImagenGrid extends StatelessWidget {
  const CardImagenGrid({
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
      padding: const EdgeInsets.symmetric(horizontal: YuGiOhSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: image,
            child: ImagenWidget(
              image: image,
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
    );
  }
}
