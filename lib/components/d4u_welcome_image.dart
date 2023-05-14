import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class D4uWelcomeImage extends StatelessWidget {
  const D4uWelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Welcome To Drone4u Admin Dashboard",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        const SizedBox(height: defaultPadding * 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(
              flex: 6,
              child: SvgPicture.asset(
                "assets/icons/welcome.svg",
                width: 250,
                height: 250,
              ),
            ),
            const Spacer()
          ],
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
