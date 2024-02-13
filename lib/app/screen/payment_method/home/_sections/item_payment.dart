part of 'package:protiendas/app/screen/payment_method/home/page.dart';

class ItemPaymentMethod extends StatelessWidget {
  const ItemPaymentMethod({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final String icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    icon,
                  ),
                  const Gap(YuGiOhSpacing.sl),
                  XigoTextMedium(
                    title,
                    color: ProTiendasUiColors.primaryColor,
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: ProTiendasUiColors.silverFoil,
                size: 10,
              ),
            ],
          ),
          const Gap(YuGiOhSpacing.sl),
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
