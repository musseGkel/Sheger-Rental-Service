import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheger_homes/components/show_alert_dialog.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/user.dart';
import 'package:sheger_homes/pages/favourites/favourites.dart';
import 'package:sheger_homes/pages/login_page/login_page.dart';
import 'package:sheger_homes/pages/my_homes/my_homes.dart';
import 'package:sheger_homes/pages/post_house/postHouse.dart';
import 'package:sheger_homes/pages/profile/profile.dart';
import 'package:sheger_homes/pages/subscription/subscription.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, user, child) {
      return Drawer(
        child: Material(
          color: Colors.white,
          child: ListView(
            children: [
              InkWell(
                onTap: () {
                  selectedPage(context: context, index: 0);
                },
                child: Container(
                  color: kPrimaryColor,
                  height: 210,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 130,
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
                      SizedBox(height: 15),
                      Text(
                        '${user.firstName} ${user.lastName} / ${user.userType.toString().substring(9)}', //to get the String Lessor or Lessee
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              user.userType == UserType.Lessor
                  ? BuildDrawerItems(
                      onChanged: () {
                        selectedPage(context: context, index: 4);
                      },
                      icon: Icons.house,
                      text: "My Homes",
                    )
                  : Container(),
              user.userType == UserType.Lessor
                  ? BuildDrawerItems(
                      onChanged: () {
                        selectedPage(context: context, index: 5);
                      },
                      icon: Icons.house,
                      text: "Post a House",
                    )
                  : Container(),
              BuildDrawerItems(
                onChanged: () {
                  selectedPage(context: context, index: 0);
                },
                icon: Icons.person,
                text: "Profile",
              ),
              // BuildDrawerItems(
              //   onChanged: () => selectedPage(context: context, index: 1),
              //   icon: Icons.subscriptions,
              //   text: "Subscriptions",
              // ),
              BuildDrawerItems(
                onChanged: () => selectedPage(context: context, index: 2),
                icon: Icons.favorite_rounded,
                text: "Favourites",
              ),
              Divider(),
              BuildDrawerItems(
                onChanged: () => selectedPage(context: context, index: 3),
                icon: Icons.logout,
                text: "Logout",
              ),
            ],
          ),
        ),
      );
    });
  }
}

selectedPage({required BuildContext context, required int index}) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.pushNamed(context, Profile.id);
      break;
    case 1:
      Navigator.pushNamed(context, Subscription.id);
      break;
    case 2:
      // Navigator.pushNamed(context, Favourites.id);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Favourites(),
        ),
      );
      break;
    case 3:
      showDialog(
        context: context,
        builder: (context) => ShowAlertDialog(
          title: 'Are you sure you want to Logout?',
          actionTitle1: 'Yes',
          action1: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, LoginPage.id);
          },
          actionTitle2: 'No',
          action2: () {
            Navigator.pop(context);
          },
        ),
      );
      break;
    case 4:
      Navigator.pushNamed(context, MyHomes.id);
      break;
    case 5:
      Navigator.pushNamed(context, PostHouse.id);
      break;
  }
}

class BuildDrawerItems extends StatelessWidget {
  final String text;
  final IconData icon;
  final onChanged;
  const BuildDrawerItems({
    Key? key,
    required this.text,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onChanged,
    );
  }
}
