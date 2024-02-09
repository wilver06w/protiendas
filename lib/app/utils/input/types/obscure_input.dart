part of '../input.dart';

class XigoObscureInput extends StatefulWidget {
  const XigoObscureInput({
    Key? key,
    required this.controller,
    this.filled = true,
    this.fillColor,
    this.title = '',
    this.titleStyle,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final bool filled;
  final Color? fillColor;
  final Widget? prefixIcon;
  final TextStyle? titleStyle;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  @override
  State<XigoObscureInput> createState() => _XigoObscureInputState();
}

class _XigoObscureInputState extends State<XigoObscureInput> {
  late bool _isObscure;

  @override
  void initState() {
    _isObscure = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              bottom: YuGiOhSpacing.xs,
              left: YuGiOhSpacing.xxs,
            ),
            child: RichText(
              text: TextSpan(
                text: widget.title,
                style: widget.titleStyle ??
                    const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      fontFamily: XigoTypography.inter,
                      color: ProTiendasUiColors.disabledColor,
                    ),
                children: const [],
              ),
            ),
          ),
        TextFormField(
          obscureText: _isObscure,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textAlign: TextAlign.start,
          validator: widget.validator,
          style: XigoText.style(),
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              child: const Icon(Icons.remove_red_eye_outlined),
            ),
            isDense: true,
            filled: widget.filled,
            fillColor: widget.fillColor ?? Colors.white,
            hintText: widget.hintText ?? widget.title,
            hintStyle: XigoText.style().copyWith(
              color: ProTiendasUiColors.silver,
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: ProTiendasUiColors.whiteSecundary,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: ProTiendasUiColors.error,
              ),
            ),
            labelStyle: TextStyle(
              fontFamily: XigoTypography.inter,
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontSize: YuGiOhSpacing.md,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            errorStyle: const TextStyle(
              color: ProTiendasUiColors.error,
            ),
          ),
        ),
      ],
    );
  }
}
