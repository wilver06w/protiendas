part of '../btn.dart';

class _XigoBtnPrimarySvgIcon extends XigoBtnInterface {
  _XigoBtnPrimarySvgIcon({
    required Color labelColor,
    required FontWeight? labelFontWeight,
    required XigoIconData icon,
    required double iconSize,
    required bool showIconAtRight,
    required bool showShadow,
    Color? iconColor,
  }) : super(
          labelColor: labelColor,
          labelFontWeight: labelFontWeight,
          buttonColor: ProTiendasUiColors.primaryColor,
          showIcon: true,
          svgColor: iconColor,
          iconSvg: icon,
          svgSize: iconSize,
          showIconAtRight: showIconAtRight,
          showShadow: showShadow,
          iconIsSvg: true,
        );
}

class XigoBtnPrimarySvgIcon extends StatelessWidget {
  const XigoBtnPrimarySvgIcon({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.md,
    this.labelColor,
    this.labelFontWeight,
    this.icon = XigoSvgIcons.alert,
    this.iconColor,
    this.iconMargin = 3.0,
    this.iconSize = 16,
    this.showIconAtRight = true,
    this.showShadow = true,
    this.borderRadius,
    this.iconIsSvg = true,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final BtnSize btnSize;
  final Color? labelColor;
  final Color? iconColor;
  final FontWeight? labelFontWeight;
  final XigoIconData icon;
  final double iconMargin;
  final double iconSize;
  final bool showIconAtRight;
  final bool showShadow;
  final bool iconIsSvg;

  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      label: label,
      onTap: onTap,
      btnSize: btnSize,
      borderRadius: borderRadius,
      btnType: _XigoBtnPrimarySvgIcon(
        labelColor: labelColor ?? ProTiendasUiColors.white,
        labelFontWeight: labelFontWeight,
        icon: icon,
        iconColor: iconColor,
        showIconAtRight: showIconAtRight,
        showShadow: showShadow,
        iconSize: iconSize,
      ),
    );
  }
}
