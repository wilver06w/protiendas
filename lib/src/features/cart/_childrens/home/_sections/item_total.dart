part of 'package:protiendas/src/features/cart/_childrens/home/page.dart';

class ItemTotal extends StatelessWidget {
  const ItemTotal({
    super.key,
    required this.left,
    required this.right,
  });

  final String left;
  final String right;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        XigoTextLarge(
          left,
          weight: FontWeight.w500,
          color: ProTiendasUiColors.black,
        ),
        XigoTextLarge(
          right,
          weight: FontWeight.w500,
          color: ProTiendasUiColors.black,
        ),
      ],
    );
  }
}
