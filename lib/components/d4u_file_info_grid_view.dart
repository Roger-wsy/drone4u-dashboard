import 'package:drone4u_dashboard/components/d4u_index.dart';
import 'package:drone4u_dashboard/constants.dart';
import 'package:drone4u_dashboard/models/MyFiles.dart';
import 'package:drone4u_dashboard/responsive.dart';
import 'package:flutter/material.dart';

class D4uFileInfoCardGridView extends StatelessWidget {
  const D4uFileInfoCardGridView({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.4,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: demoMyFiels.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => Padding(
        padding: Responsive.isDesktop(context)
            ? EdgeInsets.zero
            : const EdgeInsets.only(top: 16.0),
        child: FileInfoCard(
          info: demoMyFiels[index],
        ),
      ),
    );
  }
}
