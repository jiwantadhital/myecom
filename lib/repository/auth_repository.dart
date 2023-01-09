// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce/model/order_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:ecommerce/data_provider/data_provider.dart';
import 'package:ecommerce/model/login_model.dart';

class AuthRepository {
    final DataProvider dataService;
  AuthRepository({
    required this.dataService,
  });

    Future<dynamic> responseBody(
      {var parameters, required Response response}) async {
    var allModel;
    try {
      if (response.statusCode == 200) {
        allModel = jsonDecode(response.body);
      }
      else if(response.statusCode == 401){
        allModel = jsonDecode(response.body);
        print(response.body);
      }
    } catch (e) {
       print(response.body);
    }
        print(response.body);

    return allModel;
  }


//login
  Future<LoginModel> getAuthenticationData(
      {required String email,
      required String password,
    }) async {
    var loginModel;

    loginModel =  LoginModel.fromJson(await responseBody(
        response: await dataService.authenticate(
            email: email, password: password)));
    print("true return");
    return loginModel;
  }
}


class ProductOrder {
  final OrderProvider orderProvider;
  ProductOrder({
    required this.orderProvider,
  });
      Future<dynamic> responseBody(
      {var parameters, required Response response}) async {
    var allModel;
    try {
      if (response.statusCode == 200) {
        allModel = jsonDecode(response.body);
      }
      else if(response.statusCode == 401){
        allModel = jsonDecode(response.body);
        print(allModel);
      }
    } catch (e) {
      print(e);
    }
        print(response.body);

    return allModel;
  }


//login
  Future<OrderModel> getOrderData(
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
    var orderModel;

    orderModel =  OrderModel.fromJson(await responseBody(
        response: await orderProvider.sendOrder(
          address: address,
          created_by: created_by,
          discount: discount,
          items: items,
          order: order,
          order_code: order_code,
          order_status_id: order_status_id,
          payment_code: payment_code,
          shipping_cost: shipping_cost,
          total_price: total_price,
          user_id: user_id
           )));
    print("true return");
    return orderModel;
  }
}
