part of '../btn.dart';

class _XigoBtnCustom extends XigoBtnInterface {
  _XigoBtnCustom({
    required FontWeight? labelFontWeight,
    required bool showShadow,
    required Color labelColor,
    required Color buttonColor,
  }) : super(
          buttonColor: buttonColor,
          labelColor: labelColor,
          showShadow: showShadow,
          labelFontWeight: labelFontWeight,
        );
}

class XigoBtnCustom extends StatelessWidget {
  const XigoBtnCustom({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.mdLittlePadding,
    this.labelFontWeight,
    this.showShadow = false,
    this.borderRadius,
    this.labelColor,
    this.buttonColor,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final BtnSize btnSize;
  final FontWeight? labelFontWeight;
  final bool showShadow;
  final BorderRadiusGeometry? borderRadius;
  final Color? labelColor;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      label: label,
      onTap: onTap,
      btnSize: btnSize,
      borderRadius: borderRadius,
      btnType: _XigoBtnCustom(
        labelFontWeight: labelFontWeight ?? FontWeight.w600,
        showShadow: showShadow,
        labelColor: labelColor ?? ProTiendasUiColors.castletonGreen,
        buttonColor: buttonColor ?? ProTiendasUiColors.ufoGreen,
      ),
    );
  }
}
