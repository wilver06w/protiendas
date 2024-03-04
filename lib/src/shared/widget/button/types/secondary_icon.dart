part of '../btn.dart';

class _XigoBtnSecondaryIcon extends XigoBtnInterface {
  _XigoBtnSecondaryIcon({
    required Color labelColor,
    required FontWeight? labelFontWeight,
    required IconData icon,
    required Color? iconColor,
    required double iconMargin,
    required bool showIconAtRight,
    required bool showShadow,
  }) : super(
          labelColor: labelColor,
          labelFontWeight: labelFontWeight,
          buttonColor: Colors.transparent,
          showIcon: true,
          icon: icon,
          iconColor: iconColor,
          iconMargin: iconMargin,
          showIconAtRight: showIconAtRight,
          showShadow: showShadow,
        );
}

class XigoBtnSecondaryIcon extends StatelessWidget {
  const XigoBtnSecondaryIcon({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.md,
    this.labelColor,
    this.labelFontWeight,
    this.iconColor,
    this.icon = Icons.arrow_forward,
    this.iconMargin = 3.0,
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
      btnType: _XigoBtnSecondaryIcon(
        labelColor: labelColor ?? ProTiendasUiColors.primaryColor,
        labelFontWeight: labelFontWeight,
        icon: icon,
        iconMargin: iconMargin,
        iconColor: iconColor,
        showIconAtRight: showIconAtRight,
        showShadow: showShadow,
      ),
    );
  }
}
