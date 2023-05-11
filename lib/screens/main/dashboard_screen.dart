import 'package:drone4u_dashboard/components/d4u_index.dart';
import 'package:drone4u_dashboard/constants.dart';
import 'package:drone4u_dashboard/models/MyFiles.dart';
import 'package:drone4u_dashboard/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    List<PieChartSectionData> pieChartData = [
      PieChartSectionData(
        color: const Color.fromARGB(255, 214, 40, 84),
        value: 25,
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: const Color.fromARGB(255, 30, 30, 218),
        value: 20,
        showTitle: false,
        radius: 22,
      ),
      PieChartSectionData(
        color: const Color.fromARGB(255, 28, 199, 28),
        value: 10,
        showTitle: false,
        radius: 19,
      ),
      PieChartSectionData(
        color: const Color.fromARGB(255, 255, 217, 0),
        value: 15,
        showTitle: false,
        radius: 16,
      ),
      PieChartSectionData(
        color: const Color.fromARGB(255, 58, 125, 192),
        value: 25,
        showTitle: false,
        radius: 13,
      ),
    ];
    return SafeArea(
      child: SingleChildScrollView(
        padding: D4uPadding.a16,
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          D4uText(
                            text: "My Files",
                            textStyle: Theme.of(context).textTheme.titleMedium,
                          ),
                          ElevatedButton.icon(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding * 1.5,
                                  vertical: defaultPadding,
                                ),
                                backgroundColor: d4uPrimaryColor),
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            label: D4uText(
                              text: "Add New",
                              color: d4uSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      if (Responsive.isDesktop(context))
                        const D4uFileInfoCardGridView(
                          childAspectRatio: 1.4,
                        ),
                      if (Responsive.isTablet(context) ||
                          Responsive.isMobile(context))
                        const D4uFileInfoCardGridView(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                        ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      const D4uRecentList(),
                      if (Responsive.isMobile(context))
                        const SizedBox(
                          width: defaultPadding,
                        ),
                      if (Responsive.isMobile(context))
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: D4uStorageDetailsSection(
                            pieChartData: pieChartData,
                          ),
                        ),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(
                    height: defaultPadding,
                    width: defaultPadding,
                  ),
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: D4uStorageDetailsSection(
                      pieChartData: pieChartData,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
