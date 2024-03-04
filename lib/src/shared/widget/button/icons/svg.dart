import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class XigoSvgBuilder extends StatelessWidget {
  const XigoSvgBuilder(
    this.assetName, {
    super.key,
    this.color,
    this.height,
    this.package,
    this.width,
    this.colorBlendMode,
    this.fit,
  });

  final String assetName;
  final Color? color;
  final double? height;
  final double? width;
  final String? package;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      package: package,
      fit: fit ?? BoxFit.contain,
      colorFilter: color != null
          ? ColorFilter.mode(
              color!,
              colorBlendMode ?? BlendMode.srcIn,
            )
          : null,
    );
  }
}
