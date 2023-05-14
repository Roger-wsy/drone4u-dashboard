import 'package:drone4u_dashboard/constants.dart';
import 'package:flutter/material.dart';

import '../../components/d4u_background.dart';
import '../../components/d4u_sign_up_form.dart';
import '../../components/d4u_sign_up_top_image.dart';
import '../../responsive.dart';

class D4uSignUpScreen extends StatelessWidget {
  const D4uSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return D4uBackground(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const D4uMobileSignupScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: D4uSignUpScreenTopImage(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: D4uSignUpForm(),
                    ),
                    SizedBox(height: defaultPadding / 2),
                    // SocalSignUp()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class D4uMobileSignupScreen extends StatelessWidget {
  const D4uMobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const D4uSignUpScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: D4uSignUpForm(),
            ),
            Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}
