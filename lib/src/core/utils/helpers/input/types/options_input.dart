part of '../input.dart';

class XigoOptionsField extends StatefulWidget {
  final List<String> items;
  final String? value;
  final Function? onChanged;
  final String? placeholder;
  final bool showBorder;
  final bool showDropdownRadius;
  final Widget? icon;
  final double? iconSize;
  final Color? fillColor;
  final Color? itemLabelColor;
  final Color? hintColor;
  final BorderRadius? borderRadius;

  const XigoOptionsField({
    Key? key,
    required this.items,
    this.placeholder,
    this.onChanged,
    this.value,
    this.showBorder = true,
    this.showDropdownRadius = false,
    this.icon,
    this.iconSize,
    this.fillColor,
    this.itemLabelColor,
    this.hintColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  createState() => _XigoOptionsFieldState();
}

class _XigoOptionsFieldState extends State<XigoOptionsField> {
  String? _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ProTiendaSpacing.sl,
      ),
      decoration: BoxDecoration(
        color: widget.fillColor ?? Colors.white,
        border: widget.showBorder
            ? Border.all(
                color: ProTiendasUiColors.antiFlashWhite,
              )
            : null,
        borderRadius: widget.showBorder
            ? widget.borderRadius ?? BorderRadius.circular(10.0)
            : null,
      ),
      child: DropdownButton(
        isExpanded: true,
        underline: const SizedBox.shrink(),
        value: _value,
        icon: widget.icon,
        iconSize: widget.iconSize ?? 24.0,
        hint: XigoText.body(
          label: widget.placeholder ?? '',
          color: widget.hintColor ?? ProTiendasUiColors.chineseSilver,
          fontWeight: FontWeight.w400,
        ),
        borderRadius: widget.showDropdownRadius
            ? widget.borderRadius ?? BorderRadius.circular(10.0)
            : null,
        items: widget.items.map<DropdownMenuItem<String>>(
          (option) {
            return DropdownMenuItem<String>(
              value: option,
              child: XigoText.body(
                label: option,
                fontWeight: FontWeight.w400,
                color: widget.itemLabelColor != null
                    ? _value == option
                        ? Colors.black
                        : widget.itemLabelColor
                    : Colors.black,
              ),
            );
          },
        ).toList(),
        onChanged: (String? value) {
          if (value != null) {
            setState(() {
              _value = value;
              widget.onChanged!(value);
            });
          }
        },
      ),
    );
  }
}
