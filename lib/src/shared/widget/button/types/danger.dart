part of '../btn.dart';

class _XigoBtnDanger extends XigoBtnInterface {
  _XigoBtnDanger({
    required FontWeight? labelFontWeight,
    required bool showShadow,
    required Color labelColor,
  }) : super(
          buttonColor: ProTiendasUiColors.dangerColor,
          labelColor: labelColor,
          showShadow: showShadow,
          labelFontWeight: labelFontWeight,
        );
}

class XigoBtnDanger extends StatelessWidget {
  const XigoBtnDanger({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.md,
    this.labelColor,
    this.labelFontWeight,
    this.showShadow = true,
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
      btnType: _XigoBtnDanger(
        labelColor: labelColor ?? ProTiendasUiColors.white,
        labelFontWeight: labelFontWeight,
        showShadow: showShadow,
      ),
    );
  }
}
