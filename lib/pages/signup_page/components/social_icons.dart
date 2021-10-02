import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    Key? key,
    required this.iconData,
    this.onPressed,
  }) : super(key: key);
  final IconData iconData;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsetsDirectional.all(20),
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: kPrimaryLightColor,
            ),
            shape: BoxShape.circle),
        child: Icon(
          iconData,
          color: kPrimaryMidLightColor,
        ),
      ),
    );
  }
}
