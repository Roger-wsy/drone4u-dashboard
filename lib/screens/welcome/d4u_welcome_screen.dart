import 'package:flutter/material.dart';
import '../../components/d4u_background.dart';
import '../../components/d4u_login_signup_btn.dart';
import '../../components/d4u_welcome_image.dart';
import '../../responsive.dart';

class D4uWelcomeScreen extends StatelessWidget {
  const D4uWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return D4uBackground(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: D4uWelcomeImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: D4uLoginAndSignupBtn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: const D4uMobileWelcomeScreen(),
          ),
        ),
      ),
    );
  }
}

class D4uMobileWelcomeScreen extends StatelessWidget {
  const D4uMobileWelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const D4uWelcomeImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: D4uLoginAndSignupBtn(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
