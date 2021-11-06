import 'dart:convert';

import 'package:packing/api/networtking2.dart';

class User {
  final int? userID;
  final String? username;

  User({
    this.userID,
    this.username,
  });

  static Future<User?> checkLogin(String name, String password) async {
    NetworkHelper networkHelper = NetworkHelper('test/login.php', {});
    var json = await networkHelper.postData(jsonEncode(<String, String>{
      'name': name,
      'password': password,
    }));
    if (json != null && json['error'] == false) {
      Map<String, dynamic> u = json['user'];
      User user = User(
        userID: int.parse(u["id"]),
        username: u["name"],
      );
      return user;
    }
    return null;
  }
}
