import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/constant/spacing.dart';
import 'package:protiendas/src/core/utils/helpers/text/text.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        XigoTextMedium(
          title,
          color: ProTiendasUiColors.black,
        ),
        const Gap(ProTiendaSpacing.xs),
        XigoTextMedium(
          description,
          color: ProTiendasUiColors.black,
          weight: FontWeight.bold,
        ),
      ],
    );
  }
}
