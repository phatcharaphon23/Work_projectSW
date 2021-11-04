import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String server = "192.168.43.173";
  String apiPath = "/restarant_system/api/";
  final String url;
  final Map<String, dynamic> params;
  NetworkHelper(this.url, this.params);

  Future getData() async {
    try {
      http.Response response = await http
          .get(Uri.http(server, apiPath + url, params))
          .timeout(const Duration(seconds: 60));
      if (response.statusCode == 200) {
        String data = response.body;

        return jsonDecode(data);
      } else {
        String data = response.body;

        return jsonDecode(data);
      }
    } catch (e) {
      print(e);
    }
  }

  Future postData(String jsonData) async {
    try {
      http.Response response = await http
          .post(
            Uri.http(server, apiPath + url, params),
            headers: {"Content-Type": "application/json"},
            body: jsonData,
          )
          .timeout(const Duration(seconds: 60));
      if (response.statusCode == 200) {
        String data = response.body;

        return jsonDecode(data);
      } else {
        String data = response.body;

        return jsonDecode(data);
      }
    } catch (e) {
      print(e);
    }
  }
}