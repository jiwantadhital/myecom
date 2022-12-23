import 'dart:convert';

import 'package:ecommerce/data_provider/data_provider.dart';
import 'package:ecommerce/data_provider/product_provider.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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
        response: await productProvider.getProduct()));

    return productModel;
  }
}
