import 'package:drone4u_dashboard/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class D4uSearchField extends StatelessWidget {
  const D4uSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: const TextStyle(color: d4uPrimaryColor),
        fillColor: d4uWhite,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: D4uBorderRadius.bc10,
        ),
        //suffixIcon: Container(child: Icon(Icons.search)),
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: D4uBorderRadius.bc10,
                color: d4uPrimaryColor,
              ),
              padding: D4uPadding.a8,
              margin: D4uPadding.a4,
              child: SvgPicture.asset(
                "assets/icons/Search.svg",
                color: d4uSecondaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
