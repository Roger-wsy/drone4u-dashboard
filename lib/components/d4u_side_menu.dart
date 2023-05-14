import 'package:drone4u_dashboard/constants.dart';
import 'package:drone4u_dashboard/screens/orders_screen/d4u_order_screen.dart';
import 'package:drone4u_dashboard/screens/settings_screen/d4u_setting_screen.dart';
import 'package:flutter/material.dart';

import '../screens/main/main_screen.dart';
import 'd4u_index.dart';

class D4uSideMenu extends StatelessWidget {
  const D4uSideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.125,
      elevation: 0,
      child: Container(
        color: d4uPrimaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                child: Image.asset(
                  "assets/images/drone4uLogo.png",
                  color: d4uSecondaryColor,
                ),
              ),
              D4uDrawerList(
                svgSrc: "assets/icons/menu_dashbord.svg",
                text: "Dashboard",
                press: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MainScreen();
                      },
                    ),
                    ModalRoute.withName('/dashboard'),
                  );
                },
              ),
              D4uDrawerList(
                svgSrc: "assets/icons/menu_tran.svg",
                text: "Orders",
                press: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const D4uOrdersScreen();
                      },
                    ),
                    ModalRoute.withName('/dashboard'),
                  );
                },
              ),
              D4uDrawerList(
                svgSrc: "assets/icons/menu_setting.svg",
                text: "Settings",
                press: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const D4uSettingScreen();
                      },
                    ),
                    ModalRoute.withName('/dashboard'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
