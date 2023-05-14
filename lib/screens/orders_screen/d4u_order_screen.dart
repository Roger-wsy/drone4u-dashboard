import 'package:flutter/material.dart';

import '../../components/d4u_side_menu.dart';
import '../../constants.dart';
import '../../responsive.dart';
import 'd4u_orders_table.dart';

class D4uOrdersScreen extends StatefulWidget {
  const D4uOrdersScreen({super.key});

  @override
  State<D4uOrdersScreen> createState() => _D4uOrdersScreenState();
}

class _D4uOrdersScreenState extends State<D4uOrdersScreen> {
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
                child: D4uOrdersTable(),
              )
            ],
          ),
        );
      }),
      drawer: Responsive.isMobile(context) ? const D4uSideMenu() : null,
    );
  }
}
