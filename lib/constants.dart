import 'package:flutter/material.dart';

//0xff0ff31
Color kPrimaryColor = Color(0xff2f4858);
//Color(0xff00FFFF); //-Colors.cyan; //--Color(0xff2f4858); // Color(0xff6f35a5);
Color kPrimaryLightColor = Color(0xa35b839b); //-Color(0x1300FFFF);
//Colors.cyan; //--Color(0xa35b839b); //Color(0xfff1e6ff);
Color kPrimaryMidLightColor = Color(0x2900FFFF);

const kScaffoldBackgroundColor = Colors.white; //Color(0xffd9d9d9);
const kTextfieldColor = Color(0xfff2f2f2);
const kNormalTextStyle = TextStyle(
  color: Colors.grey,
);
const kPrimaryTextColor = Colors.black;
const kTextLightColor = Colors.grey;

const kDefaultPadding = 20.0;
const kLikeColor = Colors.blue;

//const kTextFieldInputDecoration = 1;
// const kScreenSize;
void options(int x) {
  if (x == 1) {
    kPrimaryColor = Color(0xff2f4858);
    kPrimaryLightColor = Color(0xa35b839b);
  } else {
    kPrimaryColor = Color(0xff6f35a5);
    kPrimaryLightColor = Color(0xfff1e6ff);
  }
}
