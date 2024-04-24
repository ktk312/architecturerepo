import 'dart:convert';

import 'package:cleanarchwithprovider/models/department_model.dart';
import 'package:cleanarchwithprovider/services/network/service_factory.dart';
import 'package:flutter/material.dart';

class DepartmentsProvider extends ChangeNotifier {
  List<DepartmentModel> departmentsList = [];
  final serviceFactory = ServiceFactory();

  Future getDepartments() async {
    final result = await serviceFactory.departmentApiService.fetchDepartments();
    if (result != null) {
      departmentsList.clear();
      final decodedResponse = jsonDecode(result);

      for (var department in decodedResponse) {
        departmentsList.add(DepartmentModel.fromJson(department));
      }
    }
    notifyListeners();
  }
}
