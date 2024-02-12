import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';

class ImagenWidget extends StatelessWidget {
  const ImagenWidget({
    super.key,
    required this.image,
    this.height = 120,
    this.width = double.infinity,
    this.fit,
  });

  final String image;
  final double height;
  final double width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: height,
      fit: fit,
      width: width,
    );
  }
}
