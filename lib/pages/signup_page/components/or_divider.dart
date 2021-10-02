import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.6,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: 1.5,
              color: kPrimaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'OR',
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: Divider(
              height: 15,
              color: kPrimaryColor,
            ),
          )
        ],
      ),
    );
  }
}
