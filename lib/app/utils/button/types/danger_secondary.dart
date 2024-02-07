part of '../btn.dart';

class _XigoBtnDangerSecondary extends XigoBtnInterface {
  _XigoBtnDangerSecondary({
    required FontWeight? labelFontWeight,
    required Color labelColor,
  }) : super(
          buttonColor: Colors.transparent,
          labelColor: labelColor,
          showShadow: false,
          labelFontWeight: labelFontWeight,
        );
}

class XigoBtnDangerSecondary extends StatelessWidget {
  const XigoBtnDangerSecondary({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.md,
    this.labelColor,
    this.labelFontWeight,
    this.borderRadius,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final BtnSize btnSize;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      label: label,
      onTap: onTap,
      btnSize: btnSize,
      borderRadius: borderRadius,
      btnType: _XigoBtnDangerSecondary(
        labelColor: labelColor ?? ProTiendasUiColors.dangerColor,
        labelFontWeight: labelFontWeight,
      ),
    );
  }
}
