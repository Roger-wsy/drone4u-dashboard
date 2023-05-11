import 'package:drone4u_dashboard/constants.dart';
import 'package:drone4u_dashboard/responsive.dart';
import 'package:flutter/material.dart';

import 'd4u_index.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            D4uText(
              text: "Dashboard",
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            if (Responsive.isDesktop(context))
              const Expanded(
                child: D4uSearchField(),
              ),
            const D4uProfileCard(),
          ],
        ),
        if (!Responsive.isDesktop(context))
          Container(
            margin: D4uPadding.v16,
            child: const D4uSearchField(),
          ),
      ],
    );
  }
}
