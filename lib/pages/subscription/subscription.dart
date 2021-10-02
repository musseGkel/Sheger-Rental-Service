import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheger_homes/models/user.dart';

class Subscription extends StatelessWidget {
  static const String id = 'subscription';
  const Subscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(Provider.of<User>(context).firstName), // Text("Subscriptons"),
      ),
    );
  }
}
