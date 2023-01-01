import 'dart:convert';

import 'package:http/http.dart' as http;



class DataProvider{
    var testUrl = 'http://127.0.0.1:8000';
    var homeUrl = "http://192.168.18.62:8000";
  Future<http.Response> authenticate(
      {required String email,
      required String password,
      }) async {
    http.Response response = await http
        .post(
      Uri.parse('$homeUrl/api/login'),
      //Required
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept':'application/json'
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    )
        .timeout(const Duration(seconds: 15), onTimeout: () {
      return http.Response('Error, Please try again later',
          400); // Request Timeout response status code
    });
    return response;
  }
}


