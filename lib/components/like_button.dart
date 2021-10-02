import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheger_homes/constants.dart';

import 'package:sheger_homes/models/house_data.dart';
import 'package:sheger_homes/models/user.dart';

class LikeButton extends StatelessWidget {
  final int indexLB;
  const LikeButton({Key? key, required this.indexLB}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool liked =
        Provider.of<HouseData>(context).houses[indexLB].liked; //houseLB.liked;

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<HouseData>(context, listen: false).like(liked, indexLB);
            Provider.of<User>(context, listen: false)
                .addToLikedHouses(indexLB + 1);
          },
          child: Icon(
            Icons.thumb_up,
            color: liked == true ? kLikeColor : kTextLightColor,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          Provider.of<HouseData>(context).houses[indexLB].likes.toString(),
          style: TextStyle(
            color: kPrimaryTextColor,
          ),
        ),
      ],
    );
  }
}
