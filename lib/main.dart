import 'package:cleanarchwithprovider/screens/login/login_screen.dart';
import 'package:cleanarchwithprovider/state/departments_provider.dart';
import 'package:cleanarchwithprovider/state/login_provider.dart';
import 'package:cleanarchwithprovider/state/users_provider.dart';
import 'package:cleanarchwithprovider/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => LoginProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => UsersProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => DepartmentsProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().lightModeTheme,
      darkTheme: AppTheme().darkModeTheme,
      home: LoginScreen(),
    );
  }
}
