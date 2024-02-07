// ████████╗██╗░░░██╗██╗░░░░░  ████████╗███████╗██╗░░██╗████████╗
// ╚══██╔══╝██║░░░██║██║░░░░░  ╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝
// ░░░██║░░░██║░░░██║██║░░░░░  ░░░██║░░░█████╗░░░╚███╔╝░░░░██║░░░
// ░░░██║░░░██║░░░██║██║░░░░░  ░░░██║░░░██╔══╝░░░██╔██╗░░░░██║░░░
// ░░░██║░░░╚██████╔╝███████╗  ░░░██║░░░███████╗██╔╝╚██╗░░░██║░░░
// ░░░╚═╝░░░░╚═════╝░╚══════╝  ░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░

part of 'text.dart';

class XigoTextRich extends StatelessWidget {
  /// Creates a Rich text widget.
  ///
  /// the default size of this widget is 12
  /// fontSize must be ```XigoTypography as int```
  /// fontFamily must be ```XigoTypography as String```
  ///

  const XigoTextRich(
    this.label, {
    Key? key,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.tags,
    this.style,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final List<XigoRichTag>? tags;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    String localLabel = label;

    for (XigoRichTag item in tags ?? []) {
      final tag = _generateTag(6);
      localLabel = localLabel.replaceAll(
        item.tag,
        '<$tag>${item.tag}</$tag>',
      );
      item.tag = tag;
    }

    return StyledText(
      text: localLabel,
      tags: {
        for (XigoRichTag item in tags ?? [])
          item.tag: StyledTextActionTag(
            (_, __) => (item.onTap != null) ? item.onTap!() : null,
            style: item.style,
          )
      },
      textAlign: textAlign,
      style: const TextStyle(
        package: 'mobile_tds',
        fontStyle: FontStyle.normal,
        fontFamily: XigoTypography.inter,
        color: ProTiendasUiColors.raisinBlack,
        fontSize: XigoTypography.captionSmall,
      ).merge(style),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }

  String _generateTag(int len) {
    final random = Random();
    final result = String.fromCharCodes(
      List.generate(len, (index) => random.nextInt(33) + 89),
    );

    return result;
  }
}

class XigoTextHeading1 extends StatelessWidget {
  /// Creates a Xigoio heading text widget.
  ///
  /// the default size of this widget is 32

  const XigoTextHeading1(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.heading1,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w700,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
    );
  }
}

class XigoTextHeading2 extends StatelessWidget {
  /// Creates a Xigoio heading text widget.
  ///
  /// the default size of this widget is 28

  const XigoTextHeading2(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.shadows,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.heading2,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w700,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

class XigoTextHeading3 extends StatelessWidget {
  /// Creates a Xigoio heading text widget.
  ///
  /// the default size of this widget is 24

  const XigoTextHeading3(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.shadows,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.heading3,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w700,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

class XigoTextHeading4 extends StatelessWidget {
  /// Creates a Xigoio heading text widget.
  ///
  /// the default size of this widget is 20

  const XigoTextHeading4(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.shadows,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.heading4,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w700,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

class XigoTextHeading5 extends StatelessWidget {
  /// Creates a Xigoio heading text widget.
  ///
  /// the default size of this widget is 18

  const XigoTextHeading5(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.shadows,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.heading5,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w700,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

class XigoTextHeading6 extends StatelessWidget {
  /// Creates a Xigoio heading text widget.
  ///
  /// the default size of this widget is 16

  const XigoTextHeading6(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.shadows,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.heading6,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w600,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

class XigoTextXl extends StatelessWidget {
  /// Creates a Xigoio heading text widget.
  ///
  /// the default size of this widget is 16

  const XigoTextXl(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.shadows,
  }) : super(key: key);
  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.xl,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w600,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

class XigoTextLarge extends StatelessWidget {
  /// Creates a Xigoio heading text widget.
  ///
  /// the default size of this widget is 14

  const XigoTextLarge(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.shadows,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.large,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w400,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

class XigoTextMedium extends StatelessWidget {
  /// Creates a Xigo Text Widget based on Xigoio Design system
  ///
  ///  - The default `FontSize` for this widget is `12` and uses
  /// `NunitoSans` as a `fontFamily`
  ///
  /// - The default weight is `w400`
  /// ```dart
  /// XigoTextMedium('Xigo text here');
  /// ```
  const XigoTextMedium(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.shadows,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.medium,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w400,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

class XigoTextSmall extends StatelessWidget {
  /// Creates a Xigo Text Widget based on Xigoio Design system
  ///
  ///  - The default `FontSize` for this widget is `10` and uses
  /// `NunitoSans` as a `fontFamily`
  ///
  /// - The default weight is `w400`
  /// ```dart
  /// XigoTextSmall('Xigo text here');
  /// ```
  const XigoTextSmall(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.shadows,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.xigoSmall,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w400,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

class XigoTextCaptionS extends StatelessWidget {
  /// Creates a Xigo Text Widget based on Xigoio Design system
  ///
  ///  - The default `FontSize` for this widget is `12` and uses
  /// `NunitoSans` as a `fontFamily`
  ///
  /// - The default weight is `w400`
  /// ```dart
  /// XigoTextCaptionS('Xigo text here');
  /// ```
  const XigoTextCaptionS(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.shadows,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.captionSmall,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w400,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

class XigoTextCaptionXs extends StatelessWidget {
  /// Creates a Xigo Text Widget based on Xigoio Design system
  ///
  ///  - The default `FontSize` for this widget is `10` and uses
  /// `NunitoSans` as a `fontFamily`
  ///
  /// - The default weight is `w400`
  /// ```dart
  /// XigoTextCaptionXs('Xigo text here');
  /// ```
  const XigoTextCaptionXs(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.shadows,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.captionExtraSmall,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w400,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
    );
  }
}

class XigoTextNumberL extends StatelessWidget {
  /// Creates a Xigo Text Widget based on Xigoio Design system
  ///
  ///  - The default `FontSize` for this widget is `18` and uses
  /// `RobotoMono` as a `fontFamily`
  ///
  /// - The default weight is `Bold` or `w400`
  /// ```dart
  /// XigoTextNumberL('$ 5.600.00');
  /// ```
  const XigoTextNumberL(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.heading5,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w400,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      fontFamily: XigoTypography.robotoMono,
    );
  }
}

class XigoTextNumberM extends StatelessWidget {
  /// Creates a Xigo Text Widget based on Xigoio Design system
  ///
  ///  - The default `FontSize` for this widget is `14` and uses
  /// `RobotoMono` as a `fontFamily`
  ///
  /// - The default weight is `Bold` or `w400`
  /// ```dart
  /// XigoTextNumberM('$ 5.600.00');
  /// ```
  const XigoTextNumberM(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.large,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w400,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      fontFamily: XigoTypography.robotoMono,
    );
  }
}

class XigoTextNumberS extends StatelessWidget {
  /// Creates a Xigo Text Widget based on Xigoio Design system
  ///
  ///  - The default `FontSize` for this widget is `12` and uses
  /// `RobotoMono` as a `fontFamily`
  ///
  /// - The default weight is `Bold` or `w400`
  /// ```dart
  /// XigoTextNumberS('$ 5.600.00')
  /// ```
  const XigoTextNumberS(
    this.label, {
    Key? key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: XigoTypography.captionSmall,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: FontStyle.normal,
      fontWeight: weight ?? FontWeight.w400,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      fontFamily: XigoTypography.robotoMono,
    );
  }
}

class XigoTextCustom extends StatelessWidget {
  /// Creates a Xigoio custom text widget.
  ///
  /// the custom size

  const XigoTextCustom(
    this.label, {
    Key? key,
    required this.fontSize,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.fontStyle,
    this.shadows,
    this.fontFamily,
  }) : super(key: key);

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final double fontSize;
  final FontStyle? fontStyle;
  final List<Shadow>? shadows;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return _TextGeneric(
      key: key,
      label: label,
      fontSize: fontSize,
      color: color ?? ProTiendasUiColors.raisinBlack,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: weight ?? FontWeight.w600,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      fontFamily: fontFamily,
      decoration: decoration,
      shadows: shadows,
    );
  }
}
