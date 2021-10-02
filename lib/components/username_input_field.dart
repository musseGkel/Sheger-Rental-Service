import 'package:flutter/material.dart';
import 'package:sheger_homes/components/text_field_container.dart';
import 'package:sheger_homes/constants.dart';

class UsernameInputField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final textController;
  const UsernameInputField({
    Key? key,
    required this.hintText,
    required this.iconData,
    required this.onChanged,
    this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
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
