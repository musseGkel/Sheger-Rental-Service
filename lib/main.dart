import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/house_data.dart';
import 'package:sheger_homes/models/user.dart';
import 'package:sheger_homes/models/user_data.dart';
import 'package:sheger_homes/pages/details_page/report_page.dart';
import 'package:sheger_homes/pages/favourites/favourites.dart';
import 'package:sheger_homes/pages/home_page/home_page.dart';
import 'package:sheger_homes/pages/intro_screen/intro_screen.dart';
import 'package:sheger_homes/pages/login_page/login_page.dart';
import 'package:sheger_homes/pages/my_homes/my_homes.dart';
import 'package:sheger_homes/pages/post_house/postHouse.dart';
import 'package:sheger_homes/pages/profile/profile.dart';
import 'package:sheger_homes/pages/signup_page/signup_page.dart';
import 'package:sheger_homes/pages/subscription/subscription.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HouseData>(
        create: (context) => HouseData(),
      ),
      ChangeNotifierProvider<User>(
        create: (context) => userData.users[userData.authenticatedUserId],
      ),
      ChangeNotifierProvider<UserData>(
        create: (context) => UserData(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kScaffoldBackgroundColor,
          fontFamily: 'Sofia'),
      initialRoute: IntroScreen.id,
      routes: {
        IntroScreen.id: (context) => IntroScreen(),
        LoginPage.id: (context) => LoginPage(),
        SignUpPage.id: (context) => SignUpPage(),
        HomePage.id: (context) => HomePage(),
        MyHomes.id: (context) => MyHomes(),
        Profile.id: (context) => Profile(),
        Subscription.id: (context) => Subscription(),
        Favourites.id: (context) => Favourites(),
        PostHouse.id: (context) => PostHouse(),
        ReportPage.id: (context) => ReportPage(),
      },
    ),
  ));
}
