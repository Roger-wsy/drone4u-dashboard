import 'package:drone4u_dashboard/models/user.dart';
import 'package:drone4u_dashboard/service/user_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  List<SingleUser>? _users;

  List<SingleUser>? get users => _users;

  set users(List<SingleUser>? users) {
    _users = users;
    notifyListeners();
  }

  UserProvider() {
    initData();
  }

  initData() async {
    isLoading = true;
    print('Refreshing');
    users = await UserService.getAllUsers();
    isLoading = false;
    notifyListeners();
  }
}
