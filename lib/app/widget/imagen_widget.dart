import 'package:flutter/material.dart';

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
