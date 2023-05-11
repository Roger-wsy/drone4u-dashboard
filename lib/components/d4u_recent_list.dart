import 'package:drone4u_dashboard/constants.dart';
import 'package:drone4u_dashboard/models/RecentFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'd4u_index.dart';

class D4uRecentList extends StatelessWidget {
  const D4uRecentList({
    super.key,
  });

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
        children: [
          D4uText(
            text: "Recent Customers",
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              horizontalMargin: 0,
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  label: D4uText(
                    text: "Name",
                  ),
                ),
                DataColumn(
                  label: D4uText(
                    text: "Date",
                  ),
                ),
                DataColumn(
                  label: D4uText(
                    text: "Size",
                  ),
                )
              ],
              rows: List.generate(
                demoRecentFiles.length,
                (index) => recentFileDataRow(
                  (demoRecentFiles[index]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
                vertical: defaultPadding * 0.75,
              ),
              child: D4uText(
                text: fileInfo.title,
              ),
            ),
          ],
        ),
      ),
      DataCell(
        D4uText(
          text: fileInfo.date,
        ),
      ),
      DataCell(
        D4uText(
          text: fileInfo.size,
        ),
      ),
    ],
  );
}
