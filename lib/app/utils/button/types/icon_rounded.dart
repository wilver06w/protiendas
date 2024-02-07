part of '../btn.dart';

/// XigoBtnIconRounded.
///
/// Botón redondeado de color gris con un icono negro, el icono puede ser
/// material o un vector svg
///
/// * En primera instancia el botón intentará usar el vector svg, de ser nula
/// utilizará el icono material, debe si o si enviar uno de los dos
///
///
/// * [onPressed], (opcional) Callback que se llamará al hacer tap sobre el
/// componente.
/// * [margin], (opcional) espaciado customisado por consumidor
/// * [svgIconPath], (opcional) path del vector svg guardado en los assets de
/// la app consumidora
/// * [materialIcon], (opcional) Icono en caso de no tener svg
///
/// Ejemplo
///
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return XigoBtnIconRounded(
///	    onPressed: () {},
///	    margin:  EdgeInsets.only(
///		    right: 1,
///	    ),
///	    svgIconPath: 'assets/icon.svg',
///	    materialIcon: null,
///    );
///
/// }
/// ```
///
///

class _XigoBtnIconRounded extends XigoBtnInterface {
  _XigoBtnIconRounded({
    required bool iconIsSvg,
    required IconData icon,
    required String svgUrl,
    required bool showShadow,
    required Color iconColor,
    required Color buttonColor,
    required double iconSize,
  }) : super(
          buttonColor: buttonColor,
          labelColor: ProTiendasUiColors.primaryColor,
          showShadow: showShadow,
          iconIsSvg: iconIsSvg,
          icon: icon,
          iconMargin: 0,
          svgUrl: svgUrl,
          iconSize: iconSize,
          iconColor: iconColor,
          svgColor: ProTiendasUiColors.black,
          btnBorderRadius: 60.0,
          showIcon: true,
        );
}

class XigoBtnIconRounded extends StatelessWidget {
  const XigoBtnIconRounded({
    Key? key,
    VoidCallback? onPressed,
    Color? backgroundColor,
    this.margin,
    this.svgIconPath,
    this.materialIcon,
    this.radius,
    this.iconColor,
    this.iconSize,
    this.padding,
    this.showShadow = false,
    this.borderRadius,
  })  : onTap = onPressed,
        buttonColor = backgroundColor,
        super(key: key);

  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String? svgIconPath;
  final IconData? materialIcon;
  final Color? buttonColor;
  final Color? iconColor;
  final double? iconSize;
  final double? radius;
  final bool showShadow;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: radius ?? YuGiOhResponsive.width(YuGiOhSpacing.xl),
      height: radius ?? YuGiOhResponsive.height(YuGiOhSpacing.xl + 5),
      child: _XigoBtnGeneric(
        label: '',
        onTap: onTap,
        btnSize: const BtnSize(
          paddingH: 0,
          paddingV: 0,
          xigoText: XigoText.labelText,
        ),
        borderRadius: borderRadius,
        btnType: _XigoBtnIconRounded(
          icon: materialIcon ?? Icons.ac_unit,
          iconIsSvg: svgIconPath != null,
          svgUrl: svgIconPath ?? '',
          iconSize: iconSize ?? YuGiOhSpacing.md,
          buttonColor: buttonColor ?? ProTiendasUiColors.graySecondary,
          iconColor: iconColor ?? ProTiendasUiColors.black,
          showShadow: showShadow,
        ),
      ),
    );
  }
}
