import 'package:flutter/material.dart';
import 'package:ranya/states/Profile/profile.dart';

import 'package:ranya/states/check_status_screen.dart';
import 'package:ranya/states/create_account.dart';
import 'package:ranya/states/history_screen.dart';
import 'package:ranya/states/home.dart';
import 'package:ranya/states/information_screen.dart';
import 'package:ranya/states/login.dart';
import 'package:ranya/states/PackagingScreen/packaging_screengg.dart';
import 'package:ranya/states/scanner_screen.dart';
import 'package:ranya/utility/my_constant.dart';

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
  '/packaging01': (BuildContext context) => const PackagingScreen(),
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
