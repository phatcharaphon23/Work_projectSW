import 'package:flutter/material.dart';

class Myconstant {
  static String appName = 'Ranya';
  static String domain = 'https://c67f-180-183-234-152.ngrok.io';

  //Route
  static String routeHome = '/home';
  static String routeLogin = '/my_login';
  static String routeCreateAccount = '/create_account';
  static String routePackagingScreen = '/packaging_screen';
  static String routeHistoryScreen = '/history_screen';
  static String routeInformationScreen = '/information_screen';
  static String routeProfileScreen = '/profile_screen';

  // Image
  static String images1 = 'assets/images1.png';
  static String images2 = 'assets/images2.png';
  static String images3 = 'assets/images3.png';
  static String images4 = 'assets/images4.png';
  static String images5 = 'assets/images5.png';
  static String images6 = 'assets/images6.png';
  static String images7 = 'assets/images7.png';

  // Color
  static Color primary = Color(0xff9575cd);
  static Color dark = Color(0xff65499c);
  static Color light = Color(0xffc7a4ff);

  //Style
  TextStyle h1Style() => TextStyle(
        fontSize: 20,
        color: dark,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2Style() => TextStyle(
        fontSize: 16,
        color: dark,
        fontWeight: FontWeight.w400,
      );
  TextStyle h2BlackStyle() => TextStyle(
        fontSize: 16,
        color: Colors.grey[600],
        fontWeight: FontWeight.w400,
      );
  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3WhiteStyle() => TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );
  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: Myconstant.dark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}
