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
              if (state.model.dataBanner == null) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                height: 100,
                child: BlocBuilder<BlocHome, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: YuGiOhSpacing.sm,
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                  'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
                                ),
                              ),
                              Gap(YuGiOhSpacing.sl),
                              XigoTextSmall(
                                ProTiendasUiValues.amazon,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                XigoTextXl(
                  ProTiendasUiValues.theNew,
                  weight: FontWeight.w700,
                  color: ProTiendasUiColors.primaryColor,
                ),
                const SizedBox(
                  width: 60,
                  child: Divider(
                    thickness: 3,
                    color: ProTiendasUiColors.secondaryColor,
                    indent: 0,
                  ),
                ),
              ],
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
                          child: const CardImagen(
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
              return const CardImagenGrid(
                priceBefore: '\$480.000',
                price: '\$450.000',
                desct: '10% Dto',
                image:
                    'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
                title: ProTiendasUiValues.balonFutbol,
                isFreeSend: true,
              );
            },
          ),
        ],
      ),
    );
  }
}

class CardImagen extends StatelessWidget {
  const CardImagen({
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
        child: Column(
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
            child: Image.network(
              image,
              height: 120,
              width: double.infinity,
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
