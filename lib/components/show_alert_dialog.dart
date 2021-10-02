import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';

class ShowAlertDialog extends StatelessWidget {
  const ShowAlertDialog({
    Key? key,
    required this.title,
    required this.actionTitle1,
    required this.actionTitle2,
    this.content,
    this.action1,
    this.action2,
  }) : super(key: key);
  final String title;
  final String actionTitle1;
  final action1;
  final String actionTitle2;
  final action2;
  final content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        TextButton(
            child: container(title: actionTitle1, color: kPrimaryColor),
            onPressed: action1),
        TextButton(
            child: container(title: actionTitle2, color: kPrimaryLightColor),
            onPressed: action2)
      ],
      content: content,
      elevation: 20,
    );
  }

  Container container({required String title, required Color color}) {
    return Container(
      height: 40,
      width: 110,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
