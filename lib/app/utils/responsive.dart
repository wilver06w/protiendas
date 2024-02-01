import 'package:flutter/material.dart';

class YuGiOhResponsive {
  const YuGiOhResponsive._();
  static double _width = 0;
  static double _height = 0;
  static double _resizeHeight = 0;
  static double _resizeWidth = 0;

  static void init(
    BuildContext context, {
    required double designHeight,
    required double designWidth,
  }) {
    _resizeHeight = designHeight;
    _resizeWidth = designWidth;

    final Size size = MediaQuery.of(context).size;
    final Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      _width = size.width;
      _height = size.height;
    } else {
      _width = size.height;
      _height = size.width;
    }
  }

  static double width(double pixels) {
    if (_resizeWidth == 0) return pixels;
    double doublePercent = (pixels * 100.0) / _resizeWidth;
    return (_width * doublePercent) / 100.0;
  }

  static double height(double pixels) {
    if (_resizeHeight == 0) return pixels;
    double doublePercent = (pixels * 100.0) / _resizeHeight;
    return (_height * doublePercent) / 100.0;
  }

  static double withSizeByContext(
    BuildContext context, {
    double designWidth = 360.0,
    required double pixels,
  }) {
    double doublePercent = (pixels * 100.0) / designWidth;
    return (MediaQuery.of(context).size.width * doublePercent) / 100.0;
  }

  static double heightSizeByContext(
    BuildContext context, {
    double designHeight = 760.0,
    required double pixels,
  }) {
    double doublePercent = (pixels * 100.0) / designHeight;
    return (MediaQuery.of(context).size.height * doublePercent) / 100.0;
  }
}
