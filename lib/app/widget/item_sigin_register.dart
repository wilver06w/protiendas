import 'package:flutter/material.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/spacing.dart';

class ItemSigInRegister extends StatelessWidget {
  const ItemSigInRegister({
    super.key,
    required this.icRoute,
  });

  final String icRoute;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: ProTiendasUiColors.secondaryColor,
        ),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(
        YuGiOhSpacing.sm,
      ),
      child: Image.asset(
        icRoute,
        height: 30,
      ),
    );
  }
}
