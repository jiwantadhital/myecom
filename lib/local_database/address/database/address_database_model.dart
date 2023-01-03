// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/local_database/cart/database/cart_database_model.dart';

final String tableAddress = "address";

class AddressFields{
  static final List<String> values = [id, title, address];
  static final String id = "_id";
  static final String title = "_title";
  static final String address = "_address";
 
}

class AddressModelDatabase {
  int id;
  String title;
  String address;
  AddressModelDatabase({
    required this.id,
    required this.title,
    required this.address,
  });


AddressModelDatabase copy({
int? id,
String? title,
String? address,
})=>AddressModelDatabase(
id:id??this.id,
title: title??this.title,
address: address??this.address
);

static AddressModelDatabase fromJson(Map<String , Object?> json)=> AddressModelDatabase(
id: json[AddressFields.id] as int,
title: json[AddressFields.title] as String,
address: json[AddressFields.address] as String
);
Map<String, Object> toJson() => {
AddressFields.id : id,
AddressFields.title : title,
AddressFields.address : address
};
}