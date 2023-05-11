import 'package:drone4u_dashboard/constants.dart';
import 'package:drone4u_dashboard/models/MyFiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'd4u_index.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CloudStorageInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: D4uPadding.a16,
      decoration: const BoxDecoration(
        color: d4uWhite,
        borderRadius: D4uBorderRadius.bc10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: D4uPadding.a12,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: info.color!.withOpacity(0.2),
                  borderRadius: D4uBorderRadius.bc10,
                ),
                child: SvgPicture.asset(
                  info.svgSrc!,
                  color: info.color,
                ),
              ),
              const Icon(
                Icons.more_vert,
                color: Colors.black45,
              ),
            ],
          ),
          D4uText(
            text: info.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          D4uProgressLine(
            color: info.color!,
            percentage: info.percentage!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              D4uText(
                text: "${info.numOfFiels} Files",
                color: Colors.black54,
                fontSize: 10,
              ),
              D4uText(
                text: info.totalStorage,
                color: Colors.black,
                fontSize: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
