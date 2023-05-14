import 'package:drone4u_dashboard/constants.dart';
import 'package:drone4u_dashboard/models/RecentFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../Provider/users_provider.dart';
import '../models/user.dart';
import 'd4u_index.dart';

class D4uRecentList extends StatelessWidget {
  const D4uRecentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UserProvider(),
        builder: (context, child) {
          UserProvider model = Provider.of<UserProvider>(context);
          List<SingleUser> users = model.users ?? [];

          if (model.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            padding: D4uPadding.a16,
            decoration: const BoxDecoration(
              color: d4uWhite,
              borderRadius: D4uBorderRadius.bc10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    D4uText(
                      text: "All User",
                      fontWeight: FontWeight.bold,
                    ),
                    IconButton(
                        color: Colors.black,
                        onPressed: () async {
                          await model.initData();
                        },
                        icon: const Icon(Icons.refresh))
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    horizontalMargin: 0,
                    columnSpacing: defaultPadding,
                    columns: [
                      DataColumn(
                        label: D4uText(
                          text: "No",
                        ),
                      ),
                      DataColumn(
                        label: D4uText(
                          text: "Name",
                        ),
                      ),
                      DataColumn(
                        label: D4uText(
                          text: "E-mail",
                        ),
                      ),
                      DataColumn(
                        label: D4uText(
                          text: "Role",
                        ),
                      )
                    ],
                    rows: List.generate(users.length,
                        (index) => userDataRow(users[index], index)),
                  ),
                )
              ],
            ),
          );
        });
  }
}

DataRow userDataRow(SingleUser user, int index) {
  int count = index + 1;
  return DataRow(
    cells: [
      DataCell(
        D4uText(
          text: count.toString(),
        ),
      ),
      DataCell(
        D4uText(
          text: user.name,
        ),
      ),
      DataCell(
        D4uText(
          text: user.email,
        ),
      ),
      DataCell(
        D4uText(
          text: user.role,
        ),
      ),
    ],
  );
}
