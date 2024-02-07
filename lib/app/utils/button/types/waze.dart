part of '../btn.dart';

class _XigoBtnWaze extends XigoBtnInterface {
  _XigoBtnWaze({required showShadow})
      : super(
          labelColor: ProTiendasUiColors.white,
          buttonColor: const Color(0xff78d0e9),
          iconIsSvg: true,
          showIcon: true,
          svgUrl: 'assets/icons/waze.svg',
          svgSize: 25,
          showIconAtRight: false,
          showShadow: showShadow,
          assetPackage: 'mobile_tds',
        );
}

class XigoBtnWaze extends StatelessWidget {
  const XigoBtnWaze({
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
      btnType: _XigoBtnWaze(showShadow: showShadow),
    );
  }
}
