part of '../btn.dart';

class _XigoBtnGoogleMaps extends XigoBtnInterface {
  _XigoBtnGoogleMaps({required showShadow})
      : super(
          labelColor: ProTiendasUiColors.black,
          buttonColor: ProTiendasUiColors.white,
          iconIsSvg: true,
          showIcon: true,
          svgUrl: 'assets/icons/google_maps.svg',
          showIconAtRight: false,
          showShadow: showShadow,
          assetPackage: 'mobile_tds',
        );
}

class XigoBtnGoogleMaps extends StatelessWidget {
  const XigoBtnGoogleMaps({
    Key? key,
    required this.label,
    required this.onTap,
    this.btnSize = XigoBtnSize.md,
    this.showShadow = true,
    this.borderRadius,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final BtnSize btnSize;
  final bool showShadow;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return _XigoBtnGeneric(
      label: label,
      onTap: onTap,
      btnSize: btnSize,
      borderRadius: borderRadius,
      btnType: _XigoBtnGoogleMaps(showShadow: showShadow),
    );
  }
}
