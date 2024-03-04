import 'package:flutter/material.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/constant/spacing.dart';

class ContainerCircleColor extends StatelessWidget {
  const ContainerCircleColor({
    super.key,
    required this.widget,
    this.padding = const EdgeInsets.all(ProTiendaSpacing.md),
  });

  final Widget widget;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ProTiendasUiColors.white,
        border: Border.all(
          color: ProTiendasUiColors.lightSilver,
          width: 2,
        ),
      ),
      padding: padding,
      child: widget,
    );
  }
}
