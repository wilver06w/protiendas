part of '../input.dart';

class XigoCodeInput extends StatelessWidget {
  XigoCodeInput({
    Key? key,
    required this.controller,
    this.onCodeComplete,
    this.onChangeCode,
    this.keyboardType,
    this.textInputFormatters,
    this.boxColor,
  }) : super(key: key);

  final TextEditingController controller;
  final void Function(String)? onCodeComplete;
  final void Function(String)? onChangeCode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? textInputFormatters;
  final Color? boxColor;

  final Map<int, TextEditingController> charactersController = {
    0: TextEditingController(),
    1: TextEditingController(),
    2: TextEditingController(),
    3: TextEditingController(),
    4: TextEditingController(),
    5: TextEditingController(),
  };

  final Map<int, FocusNode> charactersFocus = {
    0: FocusNode(),
    1: FocusNode(),
    2: FocusNode(),
    3: FocusNode(),
    4: FocusNode(),
    5: FocusNode(),
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int character in charactersController.keys) ...[
          Builder(
            builder: (context) {
              charactersFocus[character]!
                  .addListener(() => _handleFocusInputListener(character));
              return Expanded(
                child: YuGiOhTextField(
                  key: Key('Xigo_tds-Xigocode-input-$character'),
                  fillColor: boxColor,
                  filled: boxColor != null,
                  controller: charactersController[character]!,
                  focusNode: charactersFocus[character],
                  contentPadding: const EdgeInsets.all(YuGiOhSpacing.sl),
                  borderRadius: BorderRadius.circular(10),
                  textAlign: TextAlign.center,
                  maxLength: 2,
                  keyboardType: keyboardType ?? TextInputType.number,
                  textInputFormatters: textInputFormatters ??
                      [FilteringTextInputFormatter.digitsOnly],
                  inputTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: YuGiOhTypography.h6,
                  ),
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  onChanged: (String text) => _handleOnChanged(text, character),
                ),
              );
            },
          ),
          if (character != 5) const SizedBox(width: YuGiOhSpacing.xs),
        ]
      ],
    );
  }

  void _handleFocusInputListener(int character) {
    if (charactersController[character]!.text == '') {
      charactersController[character]!.text = '\u200b';
    }
  }

  void _handleOnChanged(String value, int character) {
    String newValue = value;
    bool valueReplaced = false;

    if (value.length == 2) {
      final code = controller.text.split('');
      if (code.isNotEmpty && code.asMap().containsKey(character)) {
        final charAtPosition = code[character];
        newValue = value[0] == value[1]
            ? value[0]
            : value.replaceAll(charAtPosition, '');

        valueReplaced = true;
      }
    }

    List<String> code;
    if (controller.text.isEmpty) {
      controller.text = '------';
    }

    if (newValue.isNotEmpty) {
      code = controller.text.split('');
      code[character] = newValue;
      controller.clear();
      controller.text = code.join('');
      charactersController[character]!.clear();
      charactersController[character]!.text = newValue;
    } else {
      code = controller.text.split('');
      code[character] = '-';
      controller.text = code.join('');
    }

    if (!controller.text.contains('-')) {
      if (onCodeComplete != null) {
        onCodeComplete!(controller.text);
      }
      if (onChangeCode != null) {
        onChangeCode!(controller.text);
      }
      for (int focus in charactersFocus.keys) {
        charactersFocus[focus]?.unfocus();
      }

      if (valueReplaced) {
        charactersFocus[character + 1]?.requestFocus();
      }
    } else {
      if (onChangeCode != null) {
        onChangeCode!(controller.text);
      }
      if (newValue.isNotEmpty && character != 5) {
        charactersFocus[character + 1]?.requestFocus();
      } else if (newValue.isEmpty && character != 0) {
        charactersFocus[character - 1]?.requestFocus();
      }
    }
  }
}
