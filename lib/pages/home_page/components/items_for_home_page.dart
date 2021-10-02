import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sheger_homes/components/like_button.dart';
import 'package:sheger_homes/components/location_button.dart';
import 'package:sheger_homes/components/price.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/house.dart';

class ItemsForHomePage extends StatelessWidget {
  final int index;
  final House house;
  final onPress;
  const ItemsForHomePage({
    Key? key,
    required this.onPress,
    required this.house,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //bool liked = widget.house.liked;

    //House passHouse = widget.house;
    int passIndex = index;

    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xfff0f0f5),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Hero(
                  tag: house.houseId,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 15),
                            color: kPrimaryColor.withOpacity(0.75)),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        image: AssetImage(house.images[0]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      child: Text(
                        house.title,
                        style: TextStyle(
                          color: kPrimaryTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: kDefaultPadding),
                      child: LocationButton(house: house),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      // margin: EdgeInsets.only(bottom: kDefaultPadding / 2),
                      padding: EdgeInsets.only(
                          left: kDefaultPadding, bottom: kDefaultPadding / 2),
                      child: LikeButton(
                        indexLB: passIndex,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: kDefaultPadding / 4),
                  child: Price(house: house),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
