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
  '/home': (BuildContext context) =>  HomeScreen(),
  '/my_login': (BuildContext context) =>  Login(),
  '/create_account': (BuildContext context) =>  CreateAccount(),
  '/packaging_screen': (BuildContext context) =>  PackagingScreen(),
  '/history_screen': (BuildContext context) =>  HistoryScreen(),
  '/histor/information_screen': (BuildContext context) =>
       InformationScreen(),
  '/profile': (BuildContext context) =>  ProfileScreen(),
  '/check_status_screen': (BuildContext context) =>  CheckStatusScreen(),
  '/scanner_screen': (BuildContext context) =>  ScannerScreen(),
  '/packaging01': (BuildContext context) =>  PackagingScreen(),
};

String? initlalRoute;
void main() {
  initlalRoute = Myconstant.routeHome;
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Myconstant.appName,
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}
