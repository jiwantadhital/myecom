import 'dart:convert';

import 'package:ecommerce/data_provider/data_provider.dart';
import 'package:ecommerce/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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
        print(allModel);
      }
    } catch (e) {
      print(e);
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
