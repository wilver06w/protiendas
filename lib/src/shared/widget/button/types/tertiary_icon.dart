part of '../btn.dart';

class _XigoBtnTertiaryIcon extends XigoBtnInterface {
  _XigoBtnTertiaryIcon({
    required Color labelColor,
    required FontWeight? labelFontWeight,
    required IconData icon,
    required double iconMargin,
    required bool showIconAtRight,
    required bool showShadow,
    Color? iconColor,
  }) : super(
          labelColor: labelColor,
          labelFontWeight: labelFontWeight,
          buttonColor: ProTiendasUiColors.tertiaryColor,
          showIcon: true,
          iconColor: iconColor,
          icon: icon,
          iconMargin: iconMargin,
          showIconAtRight: showIconAtRight,
          showShadow: showShadow,
        );
}

class XigoBtnTertiaryIcon extends StatelessWidget {
  const XigoBtnTertiaryIcon({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.md,
    this.labelColor,
    this.labelFontWeight,
    this.icon = Icons.arrow_forward,
    this.iconMargin = 3.0,
    this.showIconAtRight = true,
    this.showShadow = true,
    this.iconColor,
    this.borderRadius,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final BtnSize btnSize;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final IconData icon;
  final double iconMargin;
  final bool showIconAtRight;
  final bool showShadow;
  final Color? iconColor;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      label: label,
      onTap: onTap,
      btnSize: btnSize,
      borderRadius: borderRadius,
      btnType: _XigoBtnTertiaryIcon(
        labelColor: labelColor ?? ProTiendasUiColors.white,
        labelFontWeight: labelFontWeight,
        icon: icon,
        iconColor: iconColor,
        iconMargin: iconMargin,
        showIconAtRight: showIconAtRight,
        showShadow: showShadow,
      ),
    );
  }
}
