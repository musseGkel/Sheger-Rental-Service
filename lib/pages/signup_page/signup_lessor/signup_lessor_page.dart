import 'package:flutter/material.dart';
import 'package:sheger_homes/components/dropdown_menu.dart';
import 'package:sheger_homes/components/round_button.dart';
import 'package:sheger_homes/components/username_input_field.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/user.dart';
import 'package:sheger_homes/models/user_data.dart';
import 'package:sheger_homes/pages/home_page/home_page.dart';

class SignupLessorPage extends StatefulWidget {
  const SignupLessorPage(
      {Key? key,
      required this.username,
      required this.email,
      required this.password,
      required this.selectedUserType})
      : super(key: key);

  final String username;
  final String email;
  final String password;
  final UserType selectedUserType;

  @override
  _SignupLessorPageState createState() => _SignupLessorPageState();
}

class _SignupLessorPageState extends State<SignupLessorPage> {
  String firstName = '';
  String lastName = '';
  final textFnameController = TextEditingController();
  final textLnameController = TextEditingController();
  List<String> genderItems = ['Male', 'Female'];
  String selectedGender = 'Male';
  List<String> countryCodes = [
    '+251',
    '+291',
    '+1',
    '+249',
    '+253',
  ];
  String selectedCountryCode = '+251';
  late String phoneNumber = '';
  bool visibility = false;

  bool verifyInput(String vFirstname, String vLastname, String vPhoneNumber) {
    if (vFirstname.length >= 2 &&
        vLastname.length >= 2 &&
        vPhoneNumber.length >= 8) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sheger Rental Service'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Text(
              'Provide those additional information for Lessor.',
              style: TextStyle(color: kPrimaryColor),
            ),
            SizedBox(
              height: 10,
            ),
            UsernameInputField(
              textController: textFnameController,
              iconData: Icons.person,
              hintText: 'Enter Firstname',
              onChanged: (value) {
                firstName = value;
              },
            ),
            UsernameInputField(
              textController: textLnameController,
              iconData: Icons.person,
              hintText: 'Enter Lastname',
              onChanged: (value) {
                lastName = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: kDefaultPadding * 2),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gender:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  DropdownMenu(
                    items: genderItems,
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: kPrimaryColor,
                      size: 35,
                    ),
                    selectedItem: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: kDefaultPadding * 2),
              child: Row(
                children: [
                  Text(
                    'Phone :',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  DropdownMenu(
                    items: countryCodes,
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: kPrimaryColor,
                      size: 35,
                    ),
                    selectedItem: selectedCountryCode,
                    onChanged: (value) {
                      setState(() {
                        selectedCountryCode = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.25),
                      borderRadius: BorderRadius.circular(15),
                      //color: Colors.grey,
                    ),
                    constraints: BoxConstraints(maxWidth: 130),
                    child: TextField(
                      onChanged: (pNumber) {
                        phoneNumber = pNumber;
                      },
                      keyboardType: TextInputType.phone,
                      //maxLength: 8,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: visibility,
              child: Text(
                'please enter the required information correctly.',
                style: TextStyle(color: Colors.red),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RoundButton(
              text: 'Create Account',
              color: kPrimaryColor,
              textColor: Colors.white,
              onPressed: () {
                if (verifyInput(firstName, lastName, phoneNumber)) {
                  // print('Input Correct');
                  setState(() {
                    visibility = false;
                  });
                  final newUserId = userData.users.last.userId + 1;
                  userData.users.add(
                    User(
                        createdAt: DateTime.now(),
                        username: widget.username,
                        email: widget.email,
                        firstName: firstName,
                        userId: newUserId,
                        lastName: lastName,
                        password: widget.password,
                        phoneNumber: '$selectedCountryCode$phoneNumber',
                        profilePicture: selectedGender == 'Male'
                            ? 'assets/images/avatar3.png'
                            : 'assets/images/avatar6.png',
                        userType: widget.selectedUserType,
                        sex: selectedGender,
                        houseMap: 'assets/images/map.png'),
                  );
                  // Provider.of<UserData>(context, listen: false)
                  //     .changeAuthenticatedUserId(newUserId - 1);
                  userData.authenticatedUserId = newUserId - 1;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                } else {
                  //print('INput not Correct');
                  setState(() {
                    visibility = true;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
