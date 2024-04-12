part of '../btn.dart';

class _XigoBtnOutline extends XigoBtnInterface {
  _XigoBtnOutline({
    required Color labelColor,
    required FontWeight? labelFontWeight,
    required Color borderColor,
  }) : super(
          labelColor: labelColor,
          labelFontWeight: labelFontWeight,
          buttonColor: Colors.transparent,
          hasBorder: true,
          borderColor: borderColor,
        );
}

class XigoBtnOutline extends StatelessWidget {
  const XigoBtnOutline({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.md,
    this.labelColor,
    this.labelFontWeight,
    this.borderColor,
    this.borderRadius,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final BtnSize btnSize;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final Color? borderColor;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      label: label,
      onTap: onTap,
      btnSize: btnSize,
      borderRadius: borderRadius,
      btnType: _XigoBtnOutline(
        labelColor: labelColor ?? ProTiendasUiColors.primaryColor,
        labelFontWeight: labelFontWeight,
        borderColor: borderColor ?? ProTiendasUiColors.primaryColor,
      ),
    );
  }
}
