import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';

class TextFieldBoxNumbers extends StatelessWidget {
  const TextFieldBoxNumbers({
    Key? key,
    required this.child,
    required this.label,
  }) : super(key: key);
  final Widget child;
  final String label;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          Container(width: 75, child: Text(label + ': ')),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
