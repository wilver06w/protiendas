part of '../btn.dart';

class _XigoBtnContrast extends XigoBtnInterface {
  _XigoBtnContrast({
    required FontWeight? labelFontWeight,
    required bool showShadow,
    required Color labelColor,
  }) : super(
          buttonColor: ProTiendasUiColors.contrastColor,
          labelColor: labelColor,
          showShadow: showShadow,
          labelFontWeight: labelFontWeight,
        );
}

class XigoBtnContrast extends StatelessWidget {
  const XigoBtnContrast({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.sm,
    this.labelColor,
    this.labelFontWeight,
    this.showShadow = false,
    this.borderRadius,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final BtnSize btnSize;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final bool showShadow;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      label: label,
      onTap: onTap,
      btnSize: btnSize,
      borderRadius: borderRadius,
      btnType: _XigoBtnContrast(
        labelColor: labelColor ?? ProTiendasUiColors.primaryColor,
        labelFontWeight: labelFontWeight ?? FontWeight.w600,
        showShadow: showShadow,
      ),
    );
  }
}
