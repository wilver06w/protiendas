part of '../input.dart';

class XigoNumberTextField extends StatelessWidget {
  const XigoNumberTextField({
    Key? key,
    this.controller,
    this.title,
    this.initialValue,
    this.hintText,
    this.autofocus = false,
    this.validator,
    this.contentPadding,
    this.inputFormatters,
    this.onChanged,
    this.maxLength,
    this.onFieldSubmitted,
    this.isRequired,
    this.toolTipRequiredOptionalText,
    this.fillColor,
    this.filled,
    this.errorText,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final String? initialValue;
  final bool autofocus;
  final FormFieldValidator<String>? validator;
  final EdgeInsets? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? isRequired;
  final String? toolTipRequiredOptionalText;
  final Color? fillColor;
  final bool? filled;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return XigoTextField(
      controller: controller,
      initialValue: initialValue,
      title: title,
      errorText: errorText,
      hintText: hintText,
      maxLength: maxLength,
      textInputFormatters: inputFormatters != null
          ? [FilteringTextInputFormatter.digitsOnly, ...inputFormatters!]
          : [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      autofocus: autofocus,
      validator: validator,
      contentPadding: contentPadding,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      isRequired: isRequired,
      toolTipRequiredOptionalText: toolTipRequiredOptionalText,
      fillColor: fillColor,
      filled: filled,
    );
  }
}
