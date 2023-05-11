import 'package:drone4u_dashboard/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'd4u_index.dart';

class D4uStorageInfoCard extends StatelessWidget {
  D4uStorageInfoCard({
    Key? key,
    this.svgSrc = '',
    this.infoTitle = '',
    this.infoSubTitle = '',
    this.infoSuffixTitle = '',
  }) : super(key: key);

  String svgSrc;
  String? infoTitle;
  String? infoSubTitle;
  String? infoSuffixTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: D4uPadding.a4,
      padding: D4uPadding.a16,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: d4uPrimaryColor.withOpacity(0.15),
        ),
        borderRadius: D4uBorderRadius.bc16,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(svgSrc),
          ),
          Expanded(
            child: Padding(
              padding: D4uPadding.h16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  D4uText(
                    text: infoTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  D4uText(
                    text: infoSubTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.red[700],
                  ),
                ],
              ),
            ),
          ),
          D4uText(
            text: infoSuffixTitle,
          ),
        ],
      ),
    );
  }
}
