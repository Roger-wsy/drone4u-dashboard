import 'package:drone4u_dashboard/constants.dart';
import 'package:flutter/material.dart';

class D4uAlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const D4uAlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account ? " : "Already have an Account ? ",
          style: const TextStyle(color: d4uPrimaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              color: d4uPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
