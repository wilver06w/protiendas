part of '../btn.dart';

class _XigoBtnPrimary extends XigoBtnInterface {
  _XigoBtnPrimary({
    required Color labelColor,
    required FontWeight? labelFontWeight,
    required bool showShadow,
    Color? backgroundColor,
  }) : super(
          buttonColor: backgroundColor ?? ProTiendasUiColors.primaryColor,
          labelColor: labelColor,
          showShadow: showShadow,
          labelFontWeight: labelFontWeight,
        );
}

class XigoBtnPrimary extends StatelessWidget {
  const XigoBtnPrimary({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.md,
    this.labelColor,
    this.labelFontWeight,
    this.showShadow = false,
    this.borderRadius,
    this.backgroundColor,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final BtnSize btnSize;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final bool showShadow;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      label: label,
      onTap: onTap,
      btnSize: btnSize,
      borderRadius: borderRadius,
      btnType: _XigoBtnPrimary(
        labelColor: labelColor ?? ProTiendasUiColors.white,
        labelFontWeight: labelFontWeight ?? FontWeight.w600,
        showShadow: showShadow,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
