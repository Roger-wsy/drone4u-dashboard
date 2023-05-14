import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../screens/auth_screen/d4u_login.dart';
import 'd4u_already_have_account_check.dart';
import 'd4u_text.dart';

class D4uSignUpForm extends StatelessWidget {
  const D4uSignUpForm({
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
          const SizedBox(height: defaultPadding / 2),
          Container(
            padding: D4uPadding.a16,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const MainScreen();
                //     },
                //   ),
                // );
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
          const SizedBox(height: defaultPadding),
          D4uAlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const D4uLoginScreen();
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
