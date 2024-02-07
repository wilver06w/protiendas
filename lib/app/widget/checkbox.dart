import 'package:flutter/material.dart';
import 'package:protiendas/app/utils/colors.dart';

class YuGiOhCheckbox extends StatelessWidget {
  const YuGiOhCheckbox({
    this.activeColor = ProTiendasUiColors.primaryColor,
    this.disabled = false,
    Key? key,
    this.onChanged,
    this.size = 24,
    this.value = false,
  }) : super(key: key);

  final Color activeColor;
  final bool disabled;
  final ValueChanged<bool?>? onChanged;
  final double size;
  final bool value;

  @override
  Widget build(BuildContext context) {
    const checkColor = Colors.white;

    return Theme(
      data: Theme.of(context).copyWith(
        disabledColor: Colors.transparent,
        unselectedWidgetColor: Colors.transparent,
      ),
      child: SizedBox(
        width: size,
        height: size,
        child: Container(
          decoration: BoxDecoration(
            color: value ? activeColor : Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: value
                ? null
                : Border.all(
                    color: ProTiendasUiColors.disabledColor.withOpacity(0.50),
                  ),
          ),
          clipBehavior: Clip.hardEdge,
          child: Transform.scale(
            scale: 0.9,
            child: Checkbox(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              activeColor: Colors.transparent,
              checkColor: checkColor,
              value: value,
              onChanged: disabled ? null : onChanged,
            ),
          ),
        ),
      ),
    );
  }
}
