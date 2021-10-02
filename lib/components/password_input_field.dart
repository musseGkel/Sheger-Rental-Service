import 'package:flutter/material.dart';
import 'package:sheger_homes/components/text_field_container.dart';
import 'package:sheger_homes/constants.dart';

class PasswordInputField extends StatefulWidget {
  final hintText;
  final ValueChanged<String> onChanged;
  final IconData iconData;
  final textController;
  const PasswordInputField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.iconData,
    this.textController,
  }) : super(key: key);

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      controller: widget.textController,
      obscureText: obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        icon: Icon(
          widget.iconData,
          color: kPrimaryColor,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = obscureText == true ? false : true;
            });
          },
          child: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
