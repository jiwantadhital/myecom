import 'dart:convert';

import 'package:ecommerce/data_provider/data_provider.dart';
import 'package:ecommerce/data_provider/product_provider.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
//for List
class ProductRepository {
    final ProductProvider productProvider;
        var productModel;

  ProductRepository({
    required this.productProvider,
  });

    Future<dynamic> responseBody(
      {required Response response}) async {
      if (response.statusCode == 200) {
      //  final List  allModel= jsonDecode(response.body);
        //return allModel.map((e) => ProductModel.fromJson(e)).toList();
        return response.body;
      
    } else{
      throw Exception(response.reasonPhrase);
    }

  }


  Future<List<ProductModel>> getProductData() async {

    productModel =  productModelFromJson(await responseBody(
        response: await productProvider.getProduct("/api/product/showAll")));

    return productModel;
  }
}




//for map
class  UserDetailsRepo{
  final UserAuthenticated userAuthenticated;
  UserDetailsRepo({required this.userAuthenticated});
  
  Future<UserModel> getUserData()async{
    var response =await userAuthenticated.getProduct(backUrl: "/api/user/profile");
    if(response.statusCode==200){
      final userData = jsonDecode(response.body);
      return UserModel.fromJson(userData);
    }
    else{
      throw Exception(response.reasonPhrase);
    }
  }
}