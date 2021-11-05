import 'package:flutter/material.dart';
import 'package:packing/states/PackagingScreen/home_packaging.dart';
import 'package:packing/states/Profile/profile.dart';
import 'package:packing/states/check_status_screen.dart';
import 'package:packing/states/create_account.dart';
import 'package:packing/states/history_screen.dart';
import 'package:packing/states/home.dart';
import 'package:packing/states/information_screen.dart';
import 'package:packing/states/login.dart';
import 'package:packing/states/PackagingScreen/packaging_screen.dart';
import 'package:packing/states/scanner_screen.dart';
import 'package:packing/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/home': (BuildContext context) => HomeScreen(),
  '/my_login': (BuildContext context) => Login(),
  '/create_account': (BuildContext context) => CreateAccount(),
  '/packaging_screen': (BuildContext context) => PackgingScreen(),
  '/history_screen': (BuildContext context) => HistoryScreen(),
  '/histor/information_screen': (BuildContext context) => InformationScreen(),
  '/profile': (BuildContext context) => ProfileScreen(),
  '/check_status_screen': (BuildContext context) => CheckStatusScreen(),
  '/scanner_screen': (BuildContext context) => ScannerScreen(),
  '/home_packaging': (BuildContext context) => PackagingHome(),
};

String? initlalRoute;
void main() {
  initlalRoute = Myconstant.routeHome;
  runApp(MyApp());
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
