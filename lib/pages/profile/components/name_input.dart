import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/pages/profile/components/textfield_box.dart';

class Input extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final textController;
  final String label;
  const Input({
    Key? key,
    required this.hintText,
    required this.iconData,
    required this.onChanged,
    this.textController,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      label: label,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: textController,
        onChanged: onChanged,
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
