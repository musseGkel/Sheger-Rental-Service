import 'package:flutter/material.dart';
import 'package:sheger_homes/components/round_button.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/pages/intro_screen/components/intro_content.dart';
import 'package:sheger_homes/pages/login_page/login_page.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  int currentPage = 0;
  List<Map<String, String>> introData = [
    {
      'image': "assets/images/house051.jpg",
      'text':
          'Welcome to Sheger Rental Service, a place where you can rent a house.',
    },
    {
      'image': "assets/images/house052.jpg",
      'text':
          "We help people to find a house in accordance with their financial capacity.",
    },
    {
      'image': "assets/images/house053.jpg",
      'text':
          'We offer Consistent, Trustworthy Services without 3rd party entrance',
    }
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: introData.length,
              itemBuilder: (context, index) => IntroContent(
                size: size,
                image: introData[index]['image'],
                text: introData[index]['text'],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        introData.length,
                        (index) => buildDots(index),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: RoundButton(
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      text: 'Get Started',
                      onPressed: () {
                        Navigator.pushNamed(context, LoginPage.id);
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDots(int index) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: index == currentPage ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
          color: index == currentPage
              ? kPrimaryColor
              : kPrimaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
