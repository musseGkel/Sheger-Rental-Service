import 'package:flutter/material.dart';

import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/user.dart';

class OthersProfilePicName extends StatelessWidget {
  final User user;
  const OthersProfilePicName({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        start: 25,
        top: 25,
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 10),
              color: kPrimaryLightColor.withOpacity(0.75)),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 150,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 10),
                    color: kPrimaryColor.withOpacity(0.75)),
              ],
              image: DecorationImage(
                image: AssetImage(user.profilePicture),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                '${user.firstName} ${user.lastName}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              Text(
                '${user.userType.toString().substring(9)}',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
