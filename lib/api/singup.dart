import 'dart:convert';

import 'package:packing/services/networking.dart';




class User {
  final int? userID;
  final String? username;

  User({
    this.userID,
    this.username,
  });

  static Future<User?> checkLogin(
      String name, String email, String phone,String password) async {
    NetworkHelper networkHelper = NetworkHelper('test/singup.php', {});
    var json = await networkHelper.postData(jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    }));
   
  }
}
