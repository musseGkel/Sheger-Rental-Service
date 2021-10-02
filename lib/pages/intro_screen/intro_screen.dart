import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';
import 'components/body.dart';

class IntroScreen extends StatefulWidget {
  static const String id = 'intro';
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation animation;

  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation =
        ColorTween(begin: kPrimaryColor, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
        print(animation.value);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Body(),
    );
  }
}
