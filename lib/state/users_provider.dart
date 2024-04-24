import 'dart:convert';

import 'package:cleanarchwithprovider/models/user_model.dart';
import 'package:cleanarchwithprovider/services/network/service_factory.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  List<UserModel> usersList = [];
  final serviceFactory = ServiceFactory();

  Future getUsers(String departmentID) async {
    final result = await serviceFactory.userApiService.fetchUsers(departmentID);
    if (result != null) {
      usersList.clear();
      final decodedResponse = jsonDecode(result);

      for (var user in decodedResponse) {
        usersList.add(UserModel.fromJson(user));
      }
    }
    notifyListeners();
  }
}
