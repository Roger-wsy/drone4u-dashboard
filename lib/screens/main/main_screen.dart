import 'package:drone4u_dashboard/components/d4u_index.dart';
import 'package:drone4u_dashboard/constants.dart';
import 'package:drone4u_dashboard/responsive.dart';
import 'package:drone4u_dashboard/screens/main/dashboard_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // for the drawer 1/6 screen
              if (!Responsive.isMobile(context) &&
                  !Responsive.isTablet(context))
                const D4uSideMenu(),

              if (Responsive.isMobile(context) || Responsive.isTablet(context))
                Column(
                  children: [
                    IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: const Icon(Icons.menu),
                      color: d4uPrimaryColor,
                    ),
                  ],
                ),
              // for the rest 5/6
              const Expanded(
                flex: 6,
                child: DashboardScreen(),
              )
            ],
          ),
        );
      }),
      drawer: Responsive.isMobile(context) ? D4uSideMenu() : null,
    );
  }
}
