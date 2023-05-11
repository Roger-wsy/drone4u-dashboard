import 'package:drone4u_dashboard/components/d4u_index.dart';
import 'package:drone4u_dashboard/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class D4uDrawerList extends StatelessWidget {
  D4uDrawerList({
    Key? key,
    this.svgSrc = '',
    this.text = '',
    this.press,
  }) : super(key: key);

  String svgSrc;
  String? text;
  VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: SvgPicture.asset(
        svgSrc,
        color: d4uSecondaryColor,
        height: 16,
      ),
      title: D4uText(
        text: text,
        color: d4uSecondaryColor,
      ),
    );
  }
}
