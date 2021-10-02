
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheger_homes/components/show_alert_dialog.dart';
import 'package:sheger_homes/pages/home_page/components/body.dart';
import 'package:sheger_homes/pages/home_page/components/navigation_drawer.dart';

class HomePage extends StatelessWidget {
  static const String id = 'homePage';
  HomePage({Key? key}) : super(key: key);
  late final contextX;

  @override
  Widget build(BuildContext context) {
    contextX = context;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        drawer: NavigationDrawer(),
        body: Builder(
          builder: (context) => Body(
            onPressed: (() {
              Scaffold.of(context).openDrawer();
            }),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    return showDialog(
        context: contextX,
        builder: (context) => ShowAlertDialog(
              title: 'Are You Sure You Want to Exit?',
              actionTitle1: 'Yes',
              action1: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                //exit(0);
                //Navigator.of(context).pop(true);
              },
              actionTitle2: 'No',
              action2: () {
                Navigator.of(context).pop(false);
              },
            )).then((value) => value ?? false);
  }
}
