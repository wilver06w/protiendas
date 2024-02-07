part of '../btn.dart';

class _XigoBtnPrimaryIconSvg extends XigoBtnInterface {
  _XigoBtnPrimaryIconSvg({
    required Color labelColor,
    required Color? svgColor,
    required FontWeight? labelFontWeight,
    required String svgUrl,
    required String? assetPackage,
    required bool showIconAtRight,
    required double iconMargin,
    String? svgUrlDisabled,
    required double svgSize,
  }) : super(
          assetPackage: assetPackage,
          buttonColor: ProTiendasUiColors.primaryColor,
          iconIsSvg: true,
          svgUrlDisabled: svgUrlDisabled,
          iconMargin: iconMargin,
          labelColor: labelColor,
          labelFontWeight: labelFontWeight,
          showIcon: true,
          showIconAtRight: showIconAtRight,
          svgColor: svgColor,
          svgSize: svgSize,
          svgUrl: svgUrl,
        );
}

class XigoBtnPrimaryIconSvg extends StatelessWidget {
  const XigoBtnPrimaryIconSvg({
    Key? key,
    required this.label,
    required this.onTap,
    required this.svgUrl,
    this.assetPackage,
    this.borderRadius,
    this.btnSize = XigoBtnSize.md,
    this.iconMargin = 3.0,
    this.labelColor,
    this.labelFontWeight,
    this.showIconAtRight = true,
    this.svgColor,
    this.svgSize = 16,
    this.svgUrlDisabled,
    this.whiteLetters = false,
  }) : super(key: key);

  final BorderRadiusGeometry? borderRadius;
  final BtnSize btnSize;
  final Color? labelColor;
  final Color? svgColor;
  final FontWeight? labelFontWeight;
  final String? svgUrlDisabled;
  final String label;
  final String svgUrl;
  final String? assetPackage;
  final VoidCallback? onTap;
  final bool showIconAtRight;
  final bool whiteLetters;
  final double iconMargin;
  final double svgSize;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      borderRadius: borderRadius,
      btnSize: btnSize,
      label: label,
      onTap: onTap,
      whiteLetters: whiteLetters,
      btnType: _XigoBtnPrimaryIconSvg(
        assetPackage: assetPackage,
        iconMargin: iconMargin,
        labelColor: labelColor ?? ProTiendasUiColors.primaryColor,
        labelFontWeight: labelFontWeight,
        svgUrlDisabled: svgUrlDisabled,
        showIconAtRight: showIconAtRight,
        svgColor: svgColor,
        svgSize: svgSize,
        svgUrl: svgUrl,
      ),
    );
  }
}
