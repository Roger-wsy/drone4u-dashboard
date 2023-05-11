import 'package:drone4u_dashboard/constants.dart';
import 'package:flutter/material.dart';

class D4uProgressLine extends StatelessWidget {
  const D4uProgressLine({
    super.key,
    this.color = d4uPrimaryColor,
    required this.percentage,
  });

  final Color color;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: D4uBorderRadius.bc10,
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: D4uBorderRadius.bc10,
            ),
          ),
        ),
      ],
    );
  }
}
