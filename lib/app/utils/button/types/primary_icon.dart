part of '../btn.dart';

class _XigoBtnPrimaryIcon extends XigoBtnInterface {
  _XigoBtnPrimaryIcon({
    required Color labelColor,
    required FontWeight? labelFontWeight,
    required IconData icon,
    required double iconMargin,
    required double iconSize,
    required bool showIconAtRight,
    required bool showShadow,
    Color? iconColor,
  }) : super(
          labelColor: labelColor,
          labelFontWeight: labelFontWeight,
          buttonColor: ProTiendasUiColors.primaryColor,
          showIcon: true,
          iconColor: iconColor,
          icon: icon,
          iconMargin: iconMargin,
          iconSize: iconSize,
          showIconAtRight: showIconAtRight,
          showShadow: showShadow,
        );
}

class XigoBtnPrimaryIcon extends StatelessWidget {
  const XigoBtnPrimaryIcon({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.md,
    this.labelColor,
    this.labelFontWeight,
    this.icon = Icons.arrow_forward,
    this.iconColor,
    this.iconMargin = 3.0,
    this.iconSize = 16,
    this.showIconAtRight = true,
    this.showShadow = true,
    this.borderRadius,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final BtnSize btnSize;
  final Color? labelColor;
  final Color? iconColor;
  final FontWeight? labelFontWeight;
  final IconData icon;
  final double iconMargin;
  final double iconSize;
  final bool showIconAtRight;
  final bool showShadow;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      label: label,
      onTap: onTap,
      btnSize: btnSize,
      borderRadius: borderRadius,
      btnType: _XigoBtnPrimaryIcon(
        labelColor: labelColor ?? ProTiendasUiColors.white,
        labelFontWeight: labelFontWeight,
        icon: icon,
        iconColor: iconColor,
        iconMargin: iconMargin,
        showIconAtRight: showIconAtRight,
        showShadow: showShadow,
        iconSize: iconSize,
      ),
    );
  }
}
