import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';

import 'package:sheger_homes/models/house.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({
    Key? key,
    required this.house,
  }) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            Icons.location_pin,
            color: kPrimaryTextColor,
          ),
          Text(
            house.location,
            style: TextStyle(
              color: kPrimaryTextColor,
            ),
          )
        ],
      ),
    );
  }
}
