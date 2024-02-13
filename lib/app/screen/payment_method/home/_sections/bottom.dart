part of 'package:protiendas/app/screen/payment_method/home/page.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: YuGiOhSpacing.lg,
        vertical: YuGiOhSpacing.lg,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: ProTiendasUiColors.secondaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          XigoTextHeading6(
            ProTiendasUiValues.total,
            color: ProTiendasUiColors.primaryColor,
            weight: FontWeight.w600,
          ),
          const XigoTextHeading6(
            '\$3.000.000',
            color: ProTiendasUiColors.primaryColor,
            weight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
