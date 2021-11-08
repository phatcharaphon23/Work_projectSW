import 'dart:convert';

import 'package:packing/api/networtking2.dart';

class User {
  final int? userID;
  final String? username;

  User({
    this.userID,
    this.username,
  });

  static Future<User?> checkLogin(
      String username, String email, String phone, String password) async {
    NetworkHelper networkHelper = NetworkHelper('test/singup.php', {});
    var json = await networkHelper.postData(jsonEncode(<String, String>{
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    }));
  }
}
