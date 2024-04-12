part of '../btn.dart';

class _XigoBtnWhite extends XigoBtnInterface {
  _XigoBtnWhite({
    required Color labelColor,
    required FontWeight? labelFontWeight,
    required bool showShadow,
  }) : super(
          buttonColor: ProTiendasUiColors.white,
          labelColor: labelColor,
          showShadow: showShadow,
          labelFontWeight: labelFontWeight,
        );
}

class XigoBtnWhite extends StatelessWidget {
  const XigoBtnWhite({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.md,
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
      btnType: _XigoBtnWhite(
        labelColor: labelColor ?? ProTiendasUiColors.primaryColor,
        labelFontWeight: labelFontWeight ?? FontWeight.w600,
        showShadow: showShadow,
      ),
    );
  }
}
