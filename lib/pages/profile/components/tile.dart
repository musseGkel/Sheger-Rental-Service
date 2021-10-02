import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';

class Tile extends StatelessWidget {
  const Tile({Key? key, required this.text, required this.label})
      : super(key: key);
  final String text;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 10),
              color: kPrimaryLightColor.withOpacity(0.75)),
        ],
      ),
      alignment: Alignment.center,
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.center,
            height: double.infinity,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17),
                bottomLeft: Radius.circular(17),
              ),
              color: kPrimaryLightColor,
            ),
            child: Text(
              label + ': ',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
