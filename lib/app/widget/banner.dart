import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/protiendas_ui.dart';

class ViewBanner extends StatelessWidget {
  const ViewBanner({
    super.key,
    required this.size,
    required this.mobile,
  });

  final Size size;
  final List<String> mobile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.18,
      child: CarouselSlider(
        options: CarouselOptions(
          disableCenter: true,
          aspectRatio: size.height * 0.5,
          autoPlay: true,
          viewportFraction: 0.9,
        ),
        items: mobile.map(
          (item) {
            return Padding(
              padding: const EdgeInsets.only(
                right: YuGiOhSpacing.md,
              ),
              child: Image.asset(
                // item,
                ProTiendasUiValues.bannerTest,
                fit: BoxFit.contain,
                height: double.infinity,
                width: double.infinity,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
