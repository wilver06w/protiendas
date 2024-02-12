import 'package:flutter/material.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/text/text.dart';

class TitleSections extends StatelessWidget {
  const TitleSections({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XigoTextXl(
          title,
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
    );
  }
}
