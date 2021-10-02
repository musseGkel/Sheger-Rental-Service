import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/house.dart';

class Price extends StatelessWidget {
  const Price({
    Key? key,
    required this.house,
  }) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Price\n",
            style: TextStyle(color: kTextLightColor),
          ),
          TextSpan(
              text: "${house.price.toString()}",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: kPrimaryTextColor,
                    fontWeight: FontWeight.bold,
                  )),
          TextSpan(
            text: " Birr",
            style: TextStyle(color: kTextLightColor),
          ),
        ],
      ),
    );
  }
}
