part of '../btn.dart';

class _XigoBtnTertiaryIconSvg extends XigoBtnInterface {
  _XigoBtnTertiaryIconSvg({
    required Color labelColor,
    required FontWeight? labelFontWeight,
    required String svgUrl,
    required double iconMargin,
    required bool showIconAtRight,
    required String? assetPackage,
    required Color? svgColor,
    required double svgSize,
  }) : super(
          labelColor: labelColor,
          labelFontWeight: labelFontWeight,
          buttonColor: ProTiendasUiColors.tertiaryColor,
          iconIsSvg: true,
          showIcon: true,
          svgColor: svgColor,
          svgUrl: svgUrl,
          svgSize: svgSize,
          iconMargin: iconMargin,
          showIconAtRight: showIconAtRight,
          assetPackage: assetPackage,
        );
}

class XigoBtnTertiaryIconSvg extends StatelessWidget {
  const XigoBtnTertiaryIconSvg({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.md,
    this.labelColor,
    this.labelFontWeight,
    required this.svgUrl,
    this.iconMargin = 3.0,
    this.showIconAtRight = true,
    this.assetPackage,
    this.svgColor,
    this.svgSize = 16,
    this.borderRadius,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final BtnSize btnSize;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final String svgUrl;
  final double iconMargin;
  final bool showIconAtRight;
  final String? assetPackage;
  final Color? svgColor;
  final double svgSize;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      label: label,
      onTap: onTap,
      btnSize: btnSize,
      borderRadius: borderRadius,
      btnType: _XigoBtnTertiaryIconSvg(
        labelColor: labelColor ?? ProTiendasUiColors.primaryColor,
        labelFontWeight: labelFontWeight,
        svgUrl: svgUrl,
        iconMargin: iconMargin,
        showIconAtRight: showIconAtRight,
        assetPackage: assetPackage,
        svgColor: svgColor,
        svgSize: svgSize,
      ),
    );
  }
}
