import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../screens/auth_screen/d4u_login.dart';
import '../screens/auth_screen/d4u_sign_up_page.dart';
import 'd4u_text.dart';

class D4uLoginAndSignupBtn extends StatelessWidget {
  const D4uLoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: Container(
            padding: D4uPadding.a16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const D4uLoginScreen();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shadowColor: d4uPrimaryColor,
                elevation: 2,
                shape: const StadiumBorder(),
                minimumSize: const Size.fromHeight(48),
                backgroundColor: d4uPrimaryColor,
              ),
              child: D4uText(
                text: 'Login',
                fontSize: 20,
                color: d4uSecondaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: D4uPadding.a16,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const D4uSignUpScreen();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              shadowColor: d4uPrimaryColor,
              elevation: 2,
              shape: const StadiumBorder(),
              minimumSize: const Size.fromHeight(48),
              backgroundColor: d4uPrimaryColor,
            ),
            child: D4uText(
              text: 'Sign Up',
              fontSize: 20,
              color: d4uSecondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
