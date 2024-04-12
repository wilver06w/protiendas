part of '../btn.dart';

class _XigoBtnOutlineIcon extends XigoBtnInterface {
  _XigoBtnOutlineIcon({
    required Color labelColor,
    required FontWeight? labelFontWeight,
    required Color borderColor,
    required IconData icon,
    required double iconMargin,
    required bool showIconAtRight,
    Color? iconColor,
    String? svgUrl,
  }) : super(
          labelColor: labelColor,
          labelFontWeight: labelFontWeight,
          buttonColor: Colors.transparent,
          hasBorder: true,
          borderColor: borderColor,
          iconColor: iconColor,
          showIcon: true,
          icon: icon,
          iconMargin: iconMargin,
          showIconAtRight: showIconAtRight,
          svgUrl: svgUrl,
          iconIsSvg: svgUrl != null,
        );
}

class XigoBtnOutlineIcon extends StatelessWidget {
  const XigoBtnOutlineIcon({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.md,
    this.labelColor,
    this.labelFontWeight,
    this.borderColor,
    this.icon = Icons.filter_alt_outlined,
    this.iconMargin = 3.0,
    this.showIconAtRight = true,
    this.iconColor,
    this.svgUrl,
    this.borderRadius,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final BtnSize btnSize;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final Color? borderColor;
  final IconData icon;
  final double iconMargin;
  final bool showIconAtRight;
  final Color? iconColor;
  final String? svgUrl;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      label: label,
      onTap: onTap,
      btnSize: btnSize,
      borderRadius: borderRadius,
      btnType: _XigoBtnOutlineIcon(
        svgUrl: svgUrl,
        labelColor: labelColor ?? ProTiendasUiColors.primaryColor,
        labelFontWeight: labelFontWeight,
        borderColor: borderColor ?? ProTiendasUiColors.primaryColor,
        icon: icon,
        iconColor: iconColor,
        iconMargin: iconMargin,
        showIconAtRight: showIconAtRight,
      ),
    );
  }
}
