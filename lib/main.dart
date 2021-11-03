import 'package:flutter/material.dart';
import 'package:packing/states/home.dart';
import 'package:packing/states/login.dart';
import 'package:packing/states/Profile/profile.dart';

import 'package:packing/states/check_status_screen.dart';
import 'package:packing/states/create_account.dart';
import 'package:packing/states/history_screen.dart';
import 'package:packing/states/information_screen.dart';
import 'package:packing/states/packaging_screengg.dart';
import 'package:packing/states/scanner_screen.dart';
import 'package:packing/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/home': (BuildContext context) => const HomeScreen(),
  '/my_login': (BuildContext context) => const Login(),
  '/create_account': (BuildContext context) => const CreateAccount(),
  '/packaging_screen': (BuildContext context) => const PackagingScreen(),
  '/history_screen': (BuildContext context) => const HistoryScreen(),
  '/histor/information_screen': (BuildContext context) =>
      const InformationScreen(),
  '/profile': (BuildContext context) => const ProfileScreen(),
  '/check_status_screen': (BuildContext context) => const CheckStatusScreen(),
  '/scanner_screen': (BuildContext context) => const ScannerScreen(),
};

String? initlalRoute;
void main() {
  initlalRoute = Myconstant.routeHome;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Myconstant.appName,
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}
