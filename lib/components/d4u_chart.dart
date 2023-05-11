import 'package:drone4u_dashboard/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'd4u_index.dart';

class D4uChart extends StatelessWidget {
  const D4uChart({
    super.key,
    required this.pieChartData,
  });

  final List<PieChartSectionData> pieChartData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              startDegreeOffset: -90,
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              sections: pieChartData,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                D4uText(
                  text: "29.1",
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  color: d4uPrimaryColor,
                ),
                D4uText(
                  text: "of 128GB",
                  color: d4uPrimaryColor,
                  fontSize: 18,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
