import 'package:drone4u_dashboard/constants.dart';
import 'package:flutter/material.dart';

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
              ),
              D4uDrawerList(
                svgSrc: "assets/icons/menu_tran.svg",
                text: "Transaction",
              ),
              D4uDrawerList(
                svgSrc: "assets/icons/menu_task.svg",
                text: "Task",
              ),
              D4uDrawerList(
                svgSrc: "assets/icons/menu_doc.svg",
                text: "Documents",
              ),
              D4uDrawerList(
                svgSrc: "assets/icons/menu_store.svg",
                text: "Store",
              ),
              D4uDrawerList(
                svgSrc: "assets/icons/menu_notification.svg",
                text: "Notification",
              ),
              D4uDrawerList(
                svgSrc: "assets/icons/menu_profile.svg",
                text: "Profile",
              ),
              D4uDrawerList(
                svgSrc: "assets/icons/menu_setting.svg",
                text: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
