import 'package:cleanarchwithprovider/models/login_model.dart';
import 'package:cleanarchwithprovider/screens/departments/departments_screen.dart';
import 'package:cleanarchwithprovider/services/network/service_factory.dart';
import 'package:cleanarchwithprovider/state/login_provider.dart';
import 'package:cleanarchwithprovider/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final serviceFactory = ServiceFactory();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, loginP, child) {
      return Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'Enter Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name is Required';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final result = await serviceFactory.loginApiService
                              .loginUser(emailController.text,
                                  passwordController.text);

                          print('result :: $result');
                          if (result != null) {
                            if (result.isEmpty) {
                              print('empty');
                            } else {
                              final loginModel = loginModelFromJson(result);
                              loginP.updateLoginModel(loginModel);
                              await UserPreferences()
                                  .saveToken(loginModel.accessToken);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DepartmentsScreen()));
                            }
                          } else {
                            print('error');
                          }
                        }
                      },
                      child: const Text('Login')),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
