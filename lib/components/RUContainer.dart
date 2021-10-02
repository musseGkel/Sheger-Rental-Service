import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';

class RUContainer extends StatelessWidget {
  const RUContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: child,
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.01,
      ),
      width: size.width * 0.9,
      height: size.height * 0.3,
      decoration: BoxDecoration(
          color: kPrimaryMidLightColor,
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
