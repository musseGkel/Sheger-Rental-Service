import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheger_homes/components/dropdown_menu.dart';
import 'package:sheger_homes/components/round_button.dart';
import 'package:sheger_homes/components/show_alert_dialog.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/user.dart';
import 'package:sheger_homes/pages/profile/components/name_input.dart';
import 'package:sheger_homes/pages/profile/profile.dart';
// import 'package:sheger_homes/pages/profile/components/textfield_box.dart';
// import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<String> genderItems = ['Male', 'Female'];
  List<String> countryCodes = [
    '+251',
    '+291',
    '+1',
    '+249',
    '+253',
  ];
  late String selectedCountryCode =
      Provider.of<User>(context, listen: false).phoneNumber.substring(0, 4);
  late String phoneNumber =
      Provider.of<User>(context, listen: false).phoneNumber.substring(5);
  late String selectedGender = Provider.of<User>(context, listen: false).sex;
  late String firstName = Provider.of<User>(context, listen: false).firstName;
  late String lastName = Provider.of<User>(context, listen: false).lastName;
  bool visibility = false;
  bool verifyInput(String vFirstName, String vLastName, vPhoneNumber) {
    if (vFirstName.length >= 1 &&
        vLastName.length >= 1 &&
        vPhoneNumber.length >= 8) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, user, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        body: Center(
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 190,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 10),
                            color: kPrimaryColor.withOpacity(0.75)),
                      ],
                      image: DecorationImage(
                        image: AssetImage(user.profilePicture),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 130,
                    child: InkWell(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.red,
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheet()),
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Input(
                hintText: user.firstName,
                iconData: Icons.person,
                onChanged: (value) {
                  firstName = value;
                },
                label: "Firstname",
              ),
              Input(
                hintText: user.lastName,
                iconData: Icons.person,
                onChanged: (value) {
                  lastName = value;
                },
                label: "Lastname",
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
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
                          hintText: user.phoneNumber.substring(5),
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: visibility,
                child: Text(
                  'please enter the required information correctly.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: RoundButton(
                    text: 'Confirm Edit',
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      if (verifyInput(firstName, lastName, phoneNumber)) {
                        setState(() {
                          visibility = false;
                        });
                        showDialog(
                          context: context,
                          builder: (context) => ShowAlertDialog(
                            title:
                                'Are you sure you want to edit your profile?',
                            actionTitle1: 'Yes',
                            action1: () {
                              user.changeFirstname(firstName);
                              user.changeLastname(lastName);
                              user.changePhoneNumber(
                                  '$selectedCountryCode$phoneNumber');
                              user.changeGender(selectedGender);
                              Navigator.pop(context);
                              Navigator.pushNamed(context, Profile.id);
                            },
                            actionTitle2: 'No',
                            action2: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                      } else {
                        setState(() {
                          visibility = true;
                        });
                      }
                    }),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget bottomSheet() {
    return Container(
      height: 150,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text('Choose a Profile Photo'),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  //  selectImage(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera,
                  size: 28,
                  color: kPrimaryColor,
                ),
                label: Text('Camera'),
              ),
              TextButton.icon(
                onPressed: () {
                  // selectImage(ImageSource.camera);
                },
                icon: Icon(
                  Icons.photo,
                  size: 28,
                  color: kPrimaryColor,
                ),
                label: Text('Gallery'),
              )
            ],
          )
        ],
      ),
    );
  }
}
