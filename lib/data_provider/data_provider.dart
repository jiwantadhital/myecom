import 'dart:convert';

import 'package:http/http.dart' as http;



class DataProvider{
    var testUrl = 'http://10.0.2.2:8000';
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


class OrderProvider{
  var testUrl = 'http://10.0.2.2:8000';
    var homeUrl = "http://192.168.18.62:8000";
  Future<http.Response> sendOrder(
      {required int user_id,
      required String order_code,
      required int items,
      required int discount,
      required int shipping_cost,
      required String order,
      required String address,
      required double total_price,
      required int order_status_id,
      required String payment_code,
      required int created_by
      }) async {
    http.Response response = await http
        .post(
      Uri.parse('$homeUrl/api/order'),
      //Required
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept':'application/json'
      },
      body: jsonEncode({
        "user_id" : user_id,
        "order_code" : "qweq22",
        "items" : items,
        "discount" : "1",
        "shipping_cost" : "21",
        "order" : order,
        "address" : address,
        "total_price" : total_price,
        "order_status_id" : order_status_id,
        "payment_code" : payment_code,
        "created_by" : created_by
      }),
    )
        .timeout(const Duration(seconds: 15), onTimeout: () {
      return http.Response('Error, Please try again later',
          400); // Request Timeout response status code
    });
    return response;
  }
}