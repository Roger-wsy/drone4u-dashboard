import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone4u_dashboard/Provider/orders_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../components/d4u_text.dart';
import '../../constants.dart';
import '../../models/order.dart';
import '../../service/order_service.dart';

class D4uOrdersTable extends StatefulWidget {
  const D4uOrdersTable({super.key});

  @override
  State<D4uOrdersTable> createState() => _D4uOrdersTableState();
}

class _D4uOrdersTableState extends State<D4uOrdersTable> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => OrderProvider(),
        builder: (context, child) {
          OrderProvider model = Provider.of<OrderProvider>(context);
          List<SingleOrder> allOrders = model.allOrders ?? [];

          if (model.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Container(
            margin: D4uPadding.a8,
            padding: D4uPadding.a8,
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
                      text: "All Orders",
                      fontWeight: FontWeight.bold,
                    ),
                    // IconButton(
                    //     color: Colors.black,
                    //     onPressed: () async {
                    //       await model.initData();
                    //     },
                    //     icon: const Icon(Icons.refresh))
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // set height 40
                      height: 40,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: DataTable(
                        columnSpacing: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              20), // this only make bottom rounded and not top
                          color: Color.fromARGB(143, 248, 187, 208),
                        ),
                        // set heading row height 60
                        headingRowHeight: 60,
                        headingRowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        horizontalMargin: 30,
                        columns: [
                          DataColumn(
                            label: D4uText(
                              text: "No",
                            ),
                          ),
                          DataColumn(
                            label: D4uText(
                              text: "Booking ID",
                            ),
                          ),
                          DataColumn(
                            label: D4uText(
                              text: "Order Date",
                            ),
                          ),
                          DataColumn(
                            label: D4uText(
                              text: "Location",
                            ),
                          ),
                          DataColumn(
                            label: D4uText(
                              text: "Price(RM)",
                            ),
                          ),
                          DataColumn(
                            label: D4uText(
                              text: "Status",
                            ),
                          )
                        ],
                        rows: List.generate(allOrders.length,
                            (index) => userDataRow(allOrders[index], index)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  DataRow userDataRow(SingleOrder order, int index) {
    String formattedDate = DateFormat('yyyy-MM-dd kk:mm')
        .format(order.orderDate ?? DateTime.now());

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
            text: order.bookingId,
          ),
        ),
        DataCell(
          D4uText(
            text: formattedDate.toString(),
          ),
        ),
        DataCell(
          D4uText(
            text: order.location,
          ),
        ),
        DataCell(
          D4uText(
            text: order.totalPrice.toString(),
          ),
        ),
        DataCell(
          D4uText(
            text: order.status ?? '',
          ),
        ),
      ],
    );
  }
}
