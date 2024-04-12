part of '../input.dart';

class XigoCheckField extends StatelessWidget {
  const XigoCheckField({
    Key? key,
    required this.controller,
    this.title,
    this.validator,
    this.onChanged,
    this.textInputFormatters,
    this.onCheckTap,
    this.borderRadius,
    this.focusNode,
    this.focusedBorderColor,
    this.buttonColor,
    this.keyboardType = TextInputType.text,
    this.preffixIcon = Icons.check,
    this.isNumber = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String? title;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? textInputFormatters;
  final Function(String)? onChanged;
  final VoidCallback? onCheckTap;
  final BorderRadius? borderRadius;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final IconData preffixIcon;
  final bool isNumber;
  final Color? focusedBorderColor;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return XigoTextField(
      controller: controller,
      focusNode: focusNode,
      title: title,
      textInputFormatters: textInputFormatters,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      filled: true,
      fillColor: Colors.white,
      textAlignVertical: TextAlignVertical.center,
      hintTextStyle: const TextStyle(
        color: ProTiendasUiColors.azureishWhite,
      ),
      inputTextStyle: TextStyle(
        fontFamily:
            isNumber ? XigoTypography.robotoMono : XigoTypography.nunitoSans,
      ),
      prefixIcon: Icon(
        preffixIcon,
        size: 20,
        color: ProTiendasUiColors.sonicSilver,
      ),
      focusedBorder: focusedBorderColor != null
          ? OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: focusedBorderColor!,
              ),
            )
          : null,
      suffixIcon: Padding(
        padding: const EdgeInsets.all(ProTiendaSpacing.sm),
        child: Material(
          color: buttonColor ?? ProTiendasUiColors.primaryColor,
          borderRadius: BorderRadius.circular(5.0),
          child: InkWell(
            onTap: onCheckTap,
            child: const Center(
              child: Icon(
                Icons.check,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      suffixIconConstraints: const BoxConstraints.expand(
        height: 52.0,
        width: 52.0,
      ),
      borderRadius: borderRadius ??
          const BorderRadius.all(
            Radius.circular(10.0),
          ),
    );
  }
}
