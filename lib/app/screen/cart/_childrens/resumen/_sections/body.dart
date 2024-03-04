part of 'package:protiendas/app/screen/cart/_childrens/resumen/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return ListView(
      padding: const EdgeInsets.all(YuGiOhSpacing.xl),
      children: [
        XigoTextXl(
          ProTiendasUiValues.yourData,
          color: ProTiendasUiColors.primaryColor,
          weight: FontWeight.w500,
        ),
        const Gap(YuGiOhSpacing.md),
        ItemClientAddress(
          name: '${app.clien?.nombre} ${app.clien?.apellido}',
          address:
              'Calle 5ta norte #26-59 Centro Barrio Nuevo\nAguachica, Cesar, Colombia',
        ),
        const ItemPaymentMethod(
          numberTarjet: '6589 5496 5255 6652',
          icPaymentMethod: ProTiendasUiValues.icVisa,
        ),
        const Gap(YuGiOhSpacing.md),
        ...List.generate(
          3,
          (index) => const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: YuGiOhSpacing.lg,
              vertical: YuGiOhSpacing.sm,
            ),
            child: CardProductCart(
              quantity: 2,
              priceBefore: '\$480.000',
              price: '\$450.000',
              titleFeatures: 'Color',
              descriptionFeature: 'Arena',
              image:
                  'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
              title: 'Smart Watch para Android/iOS',
              widthImage: 90,
              heightImage: 90,
            ),
          ),
        ),
      ],
    );
  }
}

class ItemPaymentMethod extends StatelessWidget {
  const ItemPaymentMethod({
    super.key,
    required this.numberTarjet,
    required this.icPaymentMethod,
  });

  final String numberTarjet;
  final String icPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: YuGiOhSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XigoTextHeading6(
            ProTiendasUiValues.paymentMethod,
            color: ProTiendasUiColors.primaryColor,
            weight: FontWeight.w400,
          ),
          const Gap(YuGiOhSpacing.sm),
          Row(
            children: [
              Image.asset(
                icPaymentMethod,
                height: 30,
                width: 30,
              ),
              const Gap(YuGiOhSpacing.sm),
              XigoTextHeading6(
                numberTarjet,
                color: ProTiendasUiColors.primaryColor,
                weight: FontWeight.w400,
              ),
            ],
          ),
          const Gap(YuGiOhSpacing.xs),
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

class ItemClientAddress extends StatelessWidget {
  const ItemClientAddress({
    super.key,
    required this.name,
    required this.address,
  });

  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: YuGiOhSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              XigoTextHeading6(
                name,
                color: ProTiendasUiColors.primaryColor,
                weight: FontWeight.w400,
              ),
              SvgPicture.asset(
                ProTiendasUiValues.icEdit,
              ),
            ],
          ),
          const Gap(YuGiOhSpacing.sm),
          XigoTextHeading6(
            address,
            color: ProTiendasUiColors.primaryColor,
            weight: FontWeight.w400,
          ),
          const Gap(YuGiOhSpacing.xs),
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
