import 'package:flutter/material.dart';

import '../../../constants.dart';

class IntroContent extends StatelessWidget {
  const IntroContent({
    Key? key,
    required this.size,
    required this.text,
    required this.image,
  }) : super(key: key);

  final Size size;
  final image, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Spacer(),
        Text(
          'Sheger Rental Service',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Container(
          width: size.width * 0.8,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Sofia'),
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.symmetric(
            //horizontal: kDefaultPadding/,
            vertical: kDefaultPadding / 2,
          ),
          height: 350,
          width: size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                image: AssetImage(image),
              )),
        )
      ],
    );
  }
}
