import 'package:flutter/material.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/constant/responsive.dart';
import 'package:protiendas/src/core/utils/constant/spacing.dart';
import 'package:protiendas/src/core/utils/helpers/text/text.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.title,
    this.onPressed,
    this.colorText = Colors.white,
    this.borderColor = ProTiendasUiColors.majorelleBlue,
    this.backgroundColor,
  });
  final String title;
  final VoidCallback? onPressed;
  final Color colorText;
  final Color borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: backgroundColor,
        shape: onPressed != null
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(
                  color: borderColor,
                ),
              )
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: YuGiOhResponsive.withSizeByContext(
            context,
            pixels: ProTiendaSpacing.xs,
          ),
          vertical: YuGiOhResponsive.heightSizeByContext(
            context,
            pixels: ProTiendaSpacing.sm,
          ),
        ),
        child: XigoText.labelText(
          label: title,
          color: colorText,
        ),
      ),
    );
  }
}
