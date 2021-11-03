import 'dart:convert';

import 'package:ranya/api/natwortking2.dart';




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
