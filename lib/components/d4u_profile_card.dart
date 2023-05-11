import 'package:drone4u_dashboard/constants.dart';
import 'package:drone4u_dashboard/components/d4u_index.dart';
import 'package:flutter/material.dart';

class D4uProfileCard extends StatelessWidget {
  const D4uProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: d4uWhite,
        borderRadius: D4uBorderRadius.bc10,
        border: Border.all(color: d4uWhite),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          Padding(
            padding: D4uPadding.h8,
            child: D4uText(text: 'Angeline Joli'),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
