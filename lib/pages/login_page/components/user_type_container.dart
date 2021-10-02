import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';

class UserTypeContainer extends StatelessWidget {
  const UserTypeContainer(
      {Key? key,
      required this.color,
      required this.onPress,
      required this.text})
      : super(key: key);

  final Color color;
  final onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: size.width * 0.3,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(
            width: 1,
            color: kPrimaryColor,
          ),
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
