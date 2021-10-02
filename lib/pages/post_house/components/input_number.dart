import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/pages/post_house/components/textfield_box_numbers.dart';

class InputNumber extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final textController;
  final String label;
  final keybardType;
  final maxLength;

  const InputNumber({
    Key? key,
    required this.hintText,
    required this.iconData,
    required this.onChanged,
    this.textController,
    required this.label,
    this.keybardType = TextInputType.emailAddress,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldBoxNumbers(
      label: label,
      child: TextField(
        keyboardType: keybardType,
        controller: textController,
        onChanged: onChanged,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
            icon: Icon(
              iconData,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
