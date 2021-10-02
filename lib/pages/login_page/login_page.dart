import 'package:flutter/material.dart';
import 'package:sheger_homes/components/account_check_text.dart';
import 'package:sheger_homes/models/user.dart';
import 'package:sheger_homes/models/user_data.dart';
import 'package:sheger_homes/pages/home_page/home_page.dart';
import 'package:sheger_homes/pages/login_page/components/user_type_container.dart';
import 'package:sheger_homes/components/password_input_field.dart';
import 'package:sheger_homes/components/round_button.dart';
import 'package:sheger_homes/components/username_input_field.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/pages/signup_page/signup_page.dart';

String username = '';
String password = '';
final textEmailController = TextEditingController();
final textPasswordController = TextEditingController();
bool visibilityVerify = false;
bool visibilityAuthenticate = false;
late int userId;

class LoginPage extends StatefulWidget {
  static const String id = 'login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool verifyInput(String vUsername, String vPassword, UserType vUserType) {
    if (vUsername.length >= 5 &&
        vPassword.length >= 6 &&
        vUserType != UserType.niether &&
        vUsername.contains('@')) {
      return true;
    }
    return false;
  }

  bool authenticateInput(
      String atUsername, atPassword, UserType atSelectedUserType) {
    return compare(atUsername, atPassword, atSelectedUserType);
  }

  bool compare(String username, String password, UserType selectedUserType) {
    for (var user in userData.users) {
      String usernameInDb = user.username;
      String passwordInDb = user.password;
      UserType userTypeInDb = user.userType;

      if (username == usernameInDb &&
          password == passwordInDb &&
          selectedUserType == userTypeInDb) {
        userId = user.userId;
        return true;
      }
    }
    return false;
  }

  UserType selectedUserType = UserType.niether;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool haveAccount = false;

    return Scaffold(
      appBar: AppBar(
        title: Text("Sheger Rental Service"),
      ),
      body: SingleChildScrollView(
        //scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            UsernameInputField(
              textController: textEmailController,
              hintText: "Enter your Username",
              iconData: Icons.person,
              onChanged: (value) {
                username = value;
              },
            ),
            PasswordInputField(
              textController: textPasswordController,
              iconData: Icons.lock,
              hintText: 'Enter your Password',
              onChanged: (value) {
                password = value;
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
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: visibilityVerify,
              child: Text(
                'Please enter the required information correctly.',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Visibility(
              visible: visibilityAuthenticate,
              child: Text(
                'Incorrect Username or Password.',
                style: TextStyle(color: Colors.red),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RoundButton(
              text: "Login",
              color: kPrimaryColor,
              textColor: Colors.white,
              onPressed: () {
                if (verifyInput(username, password, selectedUserType)) {
                  if (authenticateInput(username, password, selectedUserType)) {
                    //authenticateInput Sucess
                    setState(() {
                      visibilityVerify = false;
                      visibilityAuthenticate = false;
                      username = '';
                      password = '';
                      selectedUserType = UserType.niether;
                      textEmailController.clear();
                      textPasswordController.clear();
                      // Provider.of<UserData>(context, listen: false)
                      //     .changeAuthenticatedUserId(userId - 1);
                      userData.authenticatedUserId = userId - 1;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );

                    //
                    // ChangeNotifierProvider(
                    //       create: (context) => userData.users[userId - 1],
                    //       child:

                    // Navigator.pushNamed(context, HomePage.id);
                  } else {
                    //authenticateInput Failed
                    setState(() {
                      visibilityVerify = false;
                      visibilityAuthenticate = true;
                    });

                    //AuthenticateInput Failed - username or password
                  }
                } else {
                  setState(() {
                    visibilityAuthenticate = false;
                    visibilityVerify = true;
                  });
                  //VerifyInput Failed - information not correctly entered
                }
              },
            ),
            Container(
              width: size.width * 0.7,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 15),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Forget Password?',
                  style: kNormalTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            AccountCheckText(
              account: haveAccount,
              onTap: () {
                Navigator.pushNamed(context, SignUpPage.id);
              },
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
