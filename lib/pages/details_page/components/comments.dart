import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';

class Comments extends StatelessWidget {
  const Comments({
    Key? key,
    required this.size,
    required this.comment,
  }) : super(key: key);

  final Size size;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xfff0f0f5),
        ),
        padding: EdgeInsets.all(kDefaultPadding / 2),
        margin: EdgeInsets.all(kDefaultPadding / 2),
        child: Text(
          "$comment",
          style: TextStyle(
            height: 1.5,
          ),
        ));
  }
}
