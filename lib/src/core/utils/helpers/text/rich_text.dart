import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/helpers/text/typography.dart';

class XigoRichModel {
  final String patternId;
  final Color? color;
  final Function()? onTap;
  final TextStyle? textStyle;

  XigoRichModel({
    required this.patternId,
    this.color,
    this.onTap,
    this.textStyle,
  });
}

class XigoRich extends StatefulWidget {
  final String text;
  final List<XigoRichModel> params;
  final TextStyle? textStyle;
  final TextAlign textAlign;

  const XigoRich({
    Key? key,
    required this.text,
    required this.params,
    this.textStyle,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  State<XigoRich> createState() => _XigoRichState();
}

class _XigoRichState extends State<XigoRich> {
  List<TextSpan> listTxtSpan = [];

  String get _text => widget.text;
  List<XigoRichModel> get _params => widget.params;

  @override
  void initState() {
    super.initState();
    _splitText();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: widget.textAlign,
      text: TextSpan(
        text: '',
        style: const TextStyle(
          fontFamily: XigoTypography.nunitoSans,
          fontStyle: FontStyle.normal,
        ).merge(widget.textStyle),
        children: listTxtSpan,
      ),
    );
  }

  //divide el texto en un array donde el patron buscado es patterId[]
  //del ejemplo quedaría: [Acepto los, a1[términos y condiciones], y las,
  // b2[políticas de privacidad]]
  //luego arma el RichText
  void _splitText() {
    List<TextSpan> lt = [];
    final split = _text.split(RegExp(r'\s*(?=\w\d\[.*?\])|(?<=\[.*?\])\s*'));

    for (int i = 0; i < split.length; i++) {
      var val =
          _params.firstWhereOrNull((e) => split[i].contains('${e.patternId}['));

      val == null
          ? lt.add(_simpleTextSpan(split[i]))
          : lt.add(_richTextSpan(val, split[i]));
    }

    setState(() {
      listTxtSpan = lt;
    });
  }

  TextSpan _richTextSpan(XigoRichModel model, String text) {
    final texto =
        text.replaceFirst('${model.patternId}[', '').replaceFirst(']', '');
    return TextSpan(
      text: '$texto ',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: model.color ?? ProTiendasUiColors.primaryColor,
      ).merge(model.textStyle),
      recognizer: TapGestureRecognizer()..onTap = model.onTap,
    );
  }

  TextSpan _simpleTextSpan(String text) {
    return TextSpan(text: '$text ');
  }
}
