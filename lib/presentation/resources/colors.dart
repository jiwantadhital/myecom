import 'package:flutter/material.dart';

class ColorManager{
  static Color backgroundColor = HexColor.fromHex("#FFFEFE"); 
  static Color textFieldColor = HexColor.fromHex("#E1E1E1"); 
  static Color boxBorder = HexColor.fromHex("#FFFEFE"); 
  static Color buttonColor = HexColor.fromHex("#810081"); 
  static Color boxBorderGrey = HexColor.fromHex("#393838"); 
  static Color primary = HexColor.fromHex("#1F222A"); 
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");

  static Color darkPrimary = HexColor.fromHex("#d17d11"); 
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFEFE");
  static Color error = HexColor.fromHex("#e61f34");

  //Social Login Box Text
  static Color boxText = HexColor.fromHex("#181B21");

  
}
extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString=hexColorString.replaceAll('#', '');
    if(hexColorString.length==6){
      hexColorString='FF'+hexColorString;
    }
    return Color(int.parse(hexColorString,radix:16));
  }
}