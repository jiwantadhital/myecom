import 'package:flutter/material.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';

void showCustomSnackbar(context,String message,{bool isError=true,String title="Error"}){
final snackBar = SnackBar(
  backgroundColor: Colors.red,
  content: Text(message),
);
 ScaffoldMessenger.of(context).showSnackBar(snackBar);
}