import 'package:cleanarchwithprovider/models/login_model.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  LoginModel? loginModel;

  updateLoginModel(LoginModel updatedModel) {
    loginModel = updatedModel;
    notifyListeners();
  }
}
