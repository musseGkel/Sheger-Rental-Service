import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';

class AccountCheckText extends StatelessWidget {
  final bool account;
  final onTap;
  const AccountCheckText({
    Key? key,
    required this.account,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          account ? "Already have an Account ? " : "Don't have an Account ? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            account ? 'Sign In' : 'Sign Up',
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
