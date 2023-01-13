import 'dart:convert';

import 'package:ecommerce/local_database/shared_prefs.dart';
import 'package:http/http.dart' as http;



class ProductProvider{
    var testUrl = 'http://10.0.2.2:8000';
    var homeUrl = "http://192.168.18.62:8000";
    var mockUrl = "https://mocki.io/v1/ea9da66f-d360-4513-8068-d91baf56792f";
  Future<http.Response> getProduct(backUrl) async {
    http.Response response = await http
        .get(
      Uri.parse(mockUrl),
      //Required
      headers: <String, String>{
        'Content-Type': 'application/json',
      },)
        .timeout(const Duration(seconds: 15), onTimeout: () {
      return http.Response('Error, Please try again later',
          400); // Request Timeout response status code
    });
    return response;
  }
}

//data after authentication
class UserAuthenticated{
    var testUrl = 'http://10.0.2.2:8000';
    var homeUrl = "http://192.168.18.62:8000";
    var mockUrl = "https://mocki.io/v1/ea9da66f-d360-4513-8068-d91baf56792f";
  Future<http.Response> getProduct({required String backUrl}) async {
    http.Response response = await http
        .get(
      Uri.parse(testUrl+backUrl),
      //Required
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer ${UserSimplePreferences.getToken()}'
      },)
        .timeout(const Duration(seconds: 15), onTimeout: () {
      return http.Response('Error, Please try again later',
          400); // Request Timeout response status code
    });
    return response;
  }
}
