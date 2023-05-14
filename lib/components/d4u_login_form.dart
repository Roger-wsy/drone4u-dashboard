import 'package:drone4u_dashboard/screens/main/dashboard_screen.dart';
import 'package:drone4u_dashboard/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../screens/auth_screen/d4u_login.dart';
import '../screens/auth_screen/d4u_sign_up_page.dart';
import 'd4u_already_have_account_check.dart';
import 'd4u_text.dart';

class D4uLoginForm extends StatelessWidget {
  const D4uLoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: d4uPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: d4uPrimaryColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: d4uPrimaryColor),
              ),
              hintText: "Your email",
              hintStyle: TextStyle(color: d4uPrimaryColor),
              prefixIconColor: d4uPrimaryColor,
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: d4uPrimaryColor,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: d4uPrimaryColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: d4uPrimaryColor),
                ),
                hintText: "Your password",
                hintStyle: TextStyle(color: d4uPrimaryColor),
                prefixIconColor: d4uPrimaryColor,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
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
                        return const MainScreen();
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
          const SizedBox(height: defaultPadding),
          D4uAlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const D4uSignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
