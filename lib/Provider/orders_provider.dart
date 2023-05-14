import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/order.dart';
import '../service/order_service.dart';

class OrderProvider extends ChangeNotifier {
  bool isLoading = false;
  List<SingleOrder>? _allOrders;

  List<SingleOrder>? get allOrders => _allOrders;

  set allOrders(List<SingleOrder>? allOrders) {
    _allOrders = allOrders;
    notifyListeners();
  }

  OrderProvider() {
    initAllOrdersData();
  }

  // initData(SingleOrder? initOrder, Product? product, {String? orderId}) async {
  //   if (orderId == null) {
  //     order = initOrder;
  //     seller = await UserService.getSingleUser(product?.sellerId ?? '');
  //     buyer = await UserService.getSingleUser(currentUser.uid);
  //     order?.buyer = buyer;
  //     order?.seller = seller;
  //     order?.product = product;
  //     order?.insurance = false;
  //     order?.orderDate = DateTime.now();
  //   } else {
  //     order = await OrderService.getSingleOrder(orderId);
  //   }

  //   notifyListeners();
  // }

  initAllOrdersData() async {
    isLoading = true;
    print('Refreshing');
    allOrders = await OrderService.getAllOrders();
    isLoading = false;
    notifyListeners();
  }

  // confirmBooking(context) async {
  //   order?.status = 'Pending';
  //   await OrderService.uploadOrder(order);
  //   Navigator.pop(context);
  //   Navigator.pushReplacementNamed(
  //     context,
  //     RouteName.successBookingPage,
  //     arguments: D4uSuccessBookingPageArgs(
  //       orderId: order?.bookingId,
  //     ),
  //   );
  // }
}
