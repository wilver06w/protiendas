part of '../btn.dart';

class _XigoBtnTransparent extends XigoBtnInterface {
  _XigoBtnTransparent({
    required FontWeight? labelFontWeight,
    required bool showShadow,
    required Color labelColor,
  }) : super(
          buttonColor: ProTiendasUiColors.white.withOpacity(0.3),
          labelColor: labelColor,
          showShadow: showShadow,
          labelFontWeight: labelFontWeight,
        );
}

class XigoBtnTransparent extends StatelessWidget {
  const XigoBtnTransparent({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.md,
    this.labelFontWeight,
    this.showShadow = false,
    this.borderRadius,
    this.labelColor,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final BtnSize btnSize;
  final FontWeight? labelFontWeight;
  final bool showShadow;
  final BorderRadiusGeometry? borderRadius;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      label: label,
      onTap: onTap,
      btnSize: btnSize,
      borderRadius: borderRadius,
      btnType: _XigoBtnTransparent(
        labelFontWeight: labelFontWeight ?? FontWeight.w600,
        showShadow: showShadow,
        labelColor: labelColor ?? ProTiendasUiColors.primaryColor,
      ),
    );
  }
}
