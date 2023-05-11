import 'package:drone4u_dashboard/components/d4u_index.dart';
import 'package:drone4u_dashboard/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class D4uStorageDetailsSection extends StatelessWidget {
  const D4uStorageDetailsSection({
    super.key,
    required this.pieChartData,
  });

  final List<PieChartSectionData> pieChartData;

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
            text: "Storage Details",
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          D4uChart(pieChartData: pieChartData),
          D4uStorageInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            infoTitle: "Documents Files",
            infoSubTitle: "1573 Files",
            infoSuffixTitle: "1.53GB",
          ),
          D4uStorageInfoCard(
            svgSrc: "assets/icons/media_file.svg",
            infoTitle: "Media Files",
            infoSubTitle: "1573 Files",
            infoSuffixTitle: "15.3GB",
          ),
          D4uStorageInfoCard(
            svgSrc: "assets/icons/folder.svg",
            infoTitle: "Other Files",
            infoSubTitle: "1573 Files",
            infoSuffixTitle: "1.53GB",
          ),
          D4uStorageInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            infoTitle: "Unknown",
            infoSubTitle: "1573 Files",
            infoSuffixTitle: "1.53GB",
          ),
        ],
      ),
    );
  }
}
