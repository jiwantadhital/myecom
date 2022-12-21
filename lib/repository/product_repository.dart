import 'dart:convert';

import 'package:ecommerce/data_provider/data_provider.dart';
import 'package:ecommerce/data_provider/product_provider.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProductRepository {
    final ProductProvider productProvider;
  ProductRepository({
    required this.productProvider,
  });

    Future<dynamic> responseBody(
      {required Response response}) async {
            print("err");

    var allModel;
    try {
      if (response.statusCode == 200) {
        print(response.body);
          allModel= List<ProductModel>.from(jsonDecode(response.body.toString()).map((x) => ProductModel.fromJson(x))) as List;
      }
    } catch (e) {
      print(e);
    }
        print(allModel);

    return allModel;
  }


//login
  Future<ProductModel> getProductData() async {
    var productModel;

    productModel =  ProductModel.fromJson(await responseBody(
        response: await productProvider.getProduct()));

    return productModel;
  }
}
