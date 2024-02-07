part of '../btn.dart';

class _XigoBtnSecondaryIconSvg extends XigoBtnInterface {
  _XigoBtnSecondaryIconSvg({
    required Color labelColor,
    required Color? svgColor,
    required FontWeight? labelFontWeight,
    required String svgUrl,
    required String? assetPackage,
    required bool showIconAtRight,
    required double iconMargin,
    required double svgSize,
    String? svgUrlDisabled,
  }) : super(
          assetPackage: assetPackage,
          buttonColor: Colors.transparent,
          iconIsSvg: true,
          iconMargin: iconMargin,
          labelColor: labelColor,
          labelFontWeight: labelFontWeight,
          svgUrlDisabled: svgUrlDisabled,
          showIcon: true,
          showIconAtRight: showIconAtRight,
          svgColor: svgColor,
          svgSize: svgSize,
          svgUrl: svgUrl,
        );
}

class XigoBtnSecondaryIconSvg extends StatelessWidget {
  const XigoBtnSecondaryIconSvg({
    Key? key,
    required this.label,
    required this.onTap,
    required this.svgUrl,
    this.assetPackage,
    this.borderRadius,
    this.btnSize = XigoBtnSize.md,
    this.grayLetters = false,
    this.iconMargin = 3.0,
    this.labelColor,
    this.labelFontWeight,
    this.svgUrlDisabled,
    this.showIconAtRight = true,
    this.svgColor,
    this.svgSize = 16,
    this.transparentColorDisabledButton = false,
  }) : super(key: key);

  final BorderRadiusGeometry? borderRadius;
  final BtnSize btnSize;
  final Color? labelColor;
  final Color? svgColor;
  final FontWeight? labelFontWeight;
  final String label;
  final String svgUrl;
  final String? assetPackage;
  final VoidCallback? onTap;
  final String? svgUrlDisabled;
  final bool showIconAtRight;
  final bool transparentColorDisabledButton;
  final bool grayLetters;
  final double iconMargin;
  final double svgSize;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      borderRadius: borderRadius,
      btnSize: btnSize,
      grayLetters: grayLetters,
      label: label,
      onTap: onTap,
      transparentColorDisabledButton: transparentColorDisabledButton,
      btnType: _XigoBtnSecondaryIconSvg(
        assetPackage: assetPackage,
        iconMargin: iconMargin,
        labelColor: labelColor ?? ProTiendasUiColors.primaryColor,
        labelFontWeight: labelFontWeight,
        showIconAtRight: showIconAtRight,
        svgColor: svgColor,
        svgUrlDisabled: svgUrlDisabled,
        svgSize: svgSize,
        svgUrl: svgUrl,
      ),
    );
  }
}
