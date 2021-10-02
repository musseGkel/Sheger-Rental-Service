import 'package:flutter/material.dart';
import 'package:sheger_homes/components/account_check_text.dart';
import 'package:sheger_homes/components/password_input_field.dart';
import 'package:sheger_homes/components/round_button.dart';
import 'package:sheger_homes/models/user.dart';

import 'package:sheger_homes/pages/login_page/components/user_type_container.dart';
import 'package:sheger_homes/pages/signup_page/components/or_divider.dart';
import 'package:sheger_homes/pages/signup_page/components/social_icons.dart';
import 'package:sheger_homes/components/username_input_field.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/pages/signup_page/signup_lessee/signup_lessee_page.dart';
import 'package:sheger_homes/pages/signup_page/signup_lessor/signup_lessor_page.dart';

String username = '';
String email = '';
String password = '';
String confirmPassword = '';
final textUserController = TextEditingController();
final textEmailController = TextEditingController();
final textConfirmPasswordController = TextEditingController();
final textPasswordController = TextEditingController();
bool visibility = false;

class SignUpPage extends StatefulWidget {
  static const String id = 'signUp';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool verifyInput(String vUsername, String vEmail, String vPassword,
      String vConfirmPassword, UserType vUserType) {
    if (vUsername.length >= 5 &&
        vUsername.contains('@') &&
        vEmail.length >= 5 &&
        vEmail.contains('@') &&
        vPassword.length >= 6 &&
        vPassword == vConfirmPassword &&
        vUserType != UserType.niether) {
      return true;
    }
    return false;
  }

  UserType selectedUserType = UserType.niether;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sheger Rental Service'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
            ),
            UsernameInputField(
              textController: textUserController,
              iconData: Icons.person,
              hintText: 'Enter Username',
              onChanged: (value) {
                username = value;
              },
            ),
            UsernameInputField(
              textController: textEmailController,
              iconData: Icons.email,
              hintText: 'Enter your Email',
              onChanged: (value) {
                email = value;
              },
            ),
            PasswordInputField(
              textController: textPasswordController,
              iconData: Icons.lock_outlined,
              hintText: 'Enter Password',
              onChanged: (value) {
                password = value;
              },
            ),
            PasswordInputField(
              textController: textConfirmPasswordController,
              iconData: Icons.lock,
              hintText: 'Confirm your Password',
              onChanged: (value) {
                confirmPassword = value;
              },
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserTypeContainer(
                    onPress: () {
                      setState(() {
                        selectedUserType = UserType.Lessee;
                      });
                    },
                    color: selectedUserType == UserType.Lessee
                        ? kPrimaryColor
                        : kPrimaryLightColor,
                    text: 'Lessee',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  UserTypeContainer(
                      color: selectedUserType == UserType.Lessor
                          ? kPrimaryColor
                          : kPrimaryLightColor,
                      onPress: () {
                        setState(() {
                          selectedUserType = UserType.Lessor;
                        });
                      },
                      text: 'Lessor')
                ],
              ),
            ),
            Visibility(
              visible: visibility,
              child: Text(
                'please enter the required information correctly.',
                style: TextStyle(color: Colors.red),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RoundButton(
              text: 'SignUp',
              color: kPrimaryColor,
              textColor: Colors.white,
              onPressed: () {
                if (verifyInput(username, email, password, confirmPassword,
                    selectedUserType)) {
                  setState(() {
                    visibility = false;
                    selectedUserType == UserType.Lessee
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupLesseePage(
                                username: username,
                                email: email,
                                password: password,
                                selectedUserType: selectedUserType,
                              ),
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupLessorPage(
                                username: username,
                                email: email,
                                password: password,
                                selectedUserType: selectedUserType,
                              ),
                            ),
                          );
                  });
                } else {
                  setState(() {
                    visibility = true;
                  });
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            AccountCheckText(
              account: true,
              onTap: () {
                Navigator.pop(context); //pushNamed(context, '/login');
              },
            ),
            SizedBox(
              height: 15,
            ),
            OrDivider(size: size),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcons(
                  iconData: Icons.facebook,
                  onPressed: () {},
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                SocialIcons(
                  iconData: Icons.facebook,
                  onPressed: () {},
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                SocialIcons(
                  iconData: Icons.facebook,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
