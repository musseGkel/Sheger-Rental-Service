import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/pages/profile/components/textfield_box.dart';

class Input extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final textController;
  final String label;
  final keybardType;
  final maxLength;

  const Input({
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
    return TextFieldBox(
      label: label,
      child: TextField(
        maxLength: maxLength == null ? null : maxLength,
        keyboardType: keybardType,
        controller: textController,
        onChanged: onChanged,
        //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
