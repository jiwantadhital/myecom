import 'package:flutter/material.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';

void showCustomSnackbar(context,String message,{Color color=Colors.red,bool isError=true,String title="Error"}){
final snackBar = SnackBar(
  backgroundColor: color,
  content: Text(message),
);
 ScaffoldMessenger.of(context).showSnackBar(snackBar);
}