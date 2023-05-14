import 'package:drone4u_dashboard/components/d4u_index.dart';
import 'package:drone4u_dashboard/constants.dart';
import 'package:drone4u_dashboard/responsive.dart';
import 'package:drone4u_dashboard/screens/main/dashboard_screen.dart';
import 'package:drone4u_dashboard/screens/settings_screen/d4u_setting.dart';
import 'package:flutter/material.dart';

class D4uSettingScreen extends StatefulWidget {
  const D4uSettingScreen({super.key});

  @override
  State<D4uSettingScreen> createState() => _D4uSettingScreenState();
}

class _D4uSettingScreenState extends State<D4uSettingScreen> {
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
                child: D4uSetting(),
              )
            ],
          ),
        );
      }),
      drawer: Responsive.isMobile(context) ? const D4uSideMenu() : null,
    );
  }
}
