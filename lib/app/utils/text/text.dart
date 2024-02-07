import 'dart:math';

import 'package:flutter/material.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/letter_spacing.dart';
import 'package:protiendas/app/utils/text/typography.dart';
import 'package:styled_text/tags/styled_text_tag_action.dart';
import 'package:styled_text/widgets/styled_text.dart';

import 'text_rich.dart';

part 'xigo_text.dart';

enum XigoTextType { h1, h2, h3, h4, h5, h6, body, title, label, small, xSmall }

class XigoText {
  XigoText._();

  ///h1 Text widget - fontSize 96
  static Widget h1({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextStyle? textStyle,
    TextDecoration? decoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: XigoTypography.h1,
        color: color ?? ProTiendasUiColors.raisinBlack,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textStyle: textStyle,
        decoration: decoration,
      );

  ///h2 Text widget - fontSize 58
  static Widget h2({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextStyle? textStyle,
    TextDecoration? decoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: XigoTypography.h2,
        color: color ?? ProTiendasUiColors.raisinBlack,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textStyle: textStyle,
        decoration: decoration,
      );

  ///h3 Text widget - fontSize 47
  static Widget h3({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextStyle? textStyle,
    TextDecoration? decoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: XigoTypography.h3,
        color: color ?? ProTiendasUiColors.raisinBlack,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textStyle: textStyle,
        decoration: decoration,
      );

  ///h4 Text widget - fontSize 33
  static Widget h4({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextStyle? textStyle,
    TextDecoration? decoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: XigoTypography.h4,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textStyle: textStyle,
        decoration: decoration,
      );

  ///h5 Text widget - fontSize 23
  static Widget h5({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextStyle? textStyle,
    TextDecoration? decoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: XigoTypography.h5,
        color: color ?? ProTiendasUiColors.raisinBlack,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textStyle: textStyle,
        decoration: decoration,
      );

  ///h6 Text widget - fontSize 19
  static Widget h6({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextStyle? textStyle,
    TextDecoration? decoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: XigoTypography.h6,
        color: color ?? ProTiendasUiColors.raisinBlack,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.bold,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textStyle: textStyle,
        decoration: decoration,
      );

  ///body Text widget - fontSize 16
  static Widget body({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextStyle? textStyle,
    TextDecoration? decoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: XigoTypography.body,
        color: color ?? ProTiendasUiColors.raisinBlack,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textStyle: textStyle,
        decoration: decoration,
      );

  ///title Text widget - fontSize 18
  static Widget title({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextStyle? textStyle,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: XigoTypography.title,
        color: color ?? ProTiendasUiColors.raisinBlack,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textStyle: textStyle,
      );

  ///labelText Text widget - fontSize 14
  static Widget labelText({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextStyle? textStyle,
    TextDecoration? decoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: XigoTypography.label,
        color: color ?? ProTiendasUiColors.raisinBlack,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textStyle: textStyle,
        decoration: decoration,
      );

  ///backofficeLabel Text widget - fontSize 14
  static Widget backofficeLabel({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextStyle? textStyle,
    TextDecoration? decoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: XigoTypography.label,
        color: color ?? ProTiendasUiColors.tertiaryColor,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.bold,
        textAlign: textAlign,
        letterSpacing: XigoLetterSpacing.label,
        textOverflow: textOverflow,
        maxLines: maxLines,
        textStyle: textStyle,
        decoration: decoration,
      );

  ///xSmall Text widget - fontSize 8
  static Widget xSmall({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextStyle? textStyle,
    TextDecoration? decoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: XigoTypography.xSmall,
        color: color ?? ProTiendasUiColors.raisinBlack,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textStyle: textStyle,
        decoration: decoration,
      );

  ///small Text widget - fontSize 12
  static Widget small({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextStyle? textStyle,
    TextDecoration? decoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: XigoTypography.small,
        color: color ?? ProTiendasUiColors.raisinBlack,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textStyle: textStyle,
        decoration: decoration,
      );

  ///rich Text widget - fontSize 14
  static Widget rich({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    double? fontSize,
    FontStyle? fontStyle,
    List<XigoRichTag>? tags,
    TextDecoration? decoration,
  }) {
    String locaLabel = label;

    for (XigoRichTag item in tags ?? []) {
      final tag = _generateTag(6);

      locaLabel = locaLabel.replaceAll(
        item.tag,
        '<$tag>${item.tag}</$tag>',
      );
      item.tag = tag;
    }

    return StyledText(
      text: locaLabel,
      tags: {
        for (XigoRichTag item in tags ?? [])
          item.tag: StyledTextActionTag(
            (_, __) => (item.onTap != null) ? item.onTap!() : null,
            style: item.style,
          )
      },
      textAlign: textAlign,
      style: TextStyle(
        package: 'mobile_tds',
        color: color ?? ProTiendasUiColors.raisinBlack,
        fontFamily: XigoTypography.inter,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle ?? FontStyle.normal,
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }

  ///small Text widget - fontSize 12
  static Widget fontBold({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextStyle? textStyle,
    TextDecoration? decoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: XigoTypography.body,
        color: color ?? ProTiendasUiColors.raisinBlack,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w600,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textStyle: textStyle,
        decoration: decoration,
      );

  ///full custom Text widget - fontSize custom
  static Widget fontSizeCustom({
    required String label,
    required double fontSize,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    TextStyle? textStyle,
    TextDecoration? decoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: fontSize,
        color: color ?? ProTiendasUiColors.raisinBlack,
        fontStyle: fontStyle,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textStyle: textStyle,
        decoration: decoration,
      );

  static TextStyle style({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    TextStyle? textStyle,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
  }) =>
      TextStyle(
        height: lineHeight,
        fontFamily: XigoTypography.inter,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle ?? FontStyle.normal,
        letterSpacing: letterSpacing,
        decoration: decoration ?? TextDecoration.none,
        shadows: shadows,
      ).merge(textStyle);

  static String _generateTag(int len) {
    final random = Random();
    final result = String.fromCharCodes(
      List.generate(len, (index) => random.nextInt(33) + 89),
    );

    return result;
  }
}

class _TextGeneric extends StatelessWidget {
  const _TextGeneric({
    required this.label,
    required this.fontSize,
    Key? key,
    this.color,
    this.fontStyle,
    this.fontWeight,
    this.textOverflow,
    this.textAlign,
    this.letterSpacing,
    this.maxLines,
    this.textStyle,
    this.decoration,
    this.fontFamily,
    this.shadows,
  }) : super(key: key);

  final String label;
  final double fontSize;
  final TextOverflow? textOverflow;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextDecoration? decoration;
  final String? fontFamily;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: fontFamily ?? XigoTypography.inter,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle ?? FontStyle.normal,
        letterSpacing: letterSpacing,
        decoration: decoration ?? TextDecoration.none,
        overflow: textOverflow,
        shadows: shadows,
      ).merge(textStyle),
    );
  }
}
