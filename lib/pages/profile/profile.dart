import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/user.dart';
import 'package:sheger_homes/pages/profile/components/profile_pic_and_name.dart';
import 'package:sheger_homes/pages/profile/edit_profile.dart';
import 'package:sheger_homes/pages/profile/components/tile.dart';

class Profile extends StatelessWidget {
  static const String id = 'profile';
  Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, user, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Profile"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                icon: Icon(Icons.mode_edit_sharp))
          ],
        ),
        body: Material(
            child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: kPrimaryColor,
                height: 120,
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                padding: EdgeInsets.only(top: 100),
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(
                  children: [
                    Tile(
                      text: '${user.email}',
                      label: 'Email',
                    ),
                    Tile(
                      text: '${user.username}',
                      label: 'Username',
                    ),
                    Tile(
                      text: '${user.sex}',
                      label: 'Gender',
                    ),
                    Tile(
                      text: '${user.phoneNumber}',
                      label: 'Phone Number',
                    ),
                  ],
                ),
              ),
              ProfilePicName()
            ],
          ),
        )),
      );
    });
  }
}
