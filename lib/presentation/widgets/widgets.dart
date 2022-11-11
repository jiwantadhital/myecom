
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:flutter/material.dart';

//back icon and top section every page
class TopSection extends StatelessWidget {
 String? text;
TopSection({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.06,
      child: Row(
        children: [
          Icon(Icons.arrow_back_rounded, color: ColorManager.white,),
          SizedBox(width: AppWidth.w20,),
          MediumText(text: text),
        ],
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  const MediumText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(text??"",
    style: TextStyle(
      fontSize: FontSize.s22,
      fontWeight: FontWeightManager.medium,
      color: ColorManager.white
    ),
    );
  }
}

class BigText extends StatelessWidget {
String text;
double size;
FontWeight weight;
BigText({required this.text, this.size = FontSize.s36, this.weight=FontWeightManager.bold});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontSize: size,
      fontWeight: weight,
      fontFamily: FontConstants.fontFamily,
      color: ColorManager.white
    ),
    );
  }
}
class SmallText extends StatelessWidget {
String text;
double size;
FontWeight weight;
Color color;
SmallText({required this.text, this.size = FontSize.s16, this.weight=FontWeightManager.medium, this.color= Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontSize: size,
      fontWeight: weight,
      fontFamily: FontConstants.fontFamily,
      color: color
    ),
    );
  }
}

//sign in sign up button
class AuthenticationWidget extends StatelessWidget {
 Color color;
 Color textColor;
 String text;
 AuthenticationWidget({required this.text, this.color=Colors.white, this.textColor=Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h60,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: SmallText(text: text,color: textColor,weight: FontWeightManager.semibold,)),
          
    );
  }
}

//textfield
class TextFieldHelp extends StatelessWidget {
  String hintText;
  IconData icon;
  IconData? backIcon;
  TextEditingController? controller;
  TextFieldHelp({required this.icon, required this.hintText, this.controller, this.backIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: ColorManager.white),
      cursorColor: ColorManager.white,
    decoration: InputDecoration(
      filled: true,
      suffixIcon: Icon(backIcon, color: ColorManager.white,),
      hoverColor: ColorManager.white,
      fillColor: ColorManager.textFieldColor,
      prefixIcon: Icon(icon,color: ColorManager.white,), 
     hintText: hintText,
      hintStyle: TextStyle(
        color: ColorManager.white
      ),
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(          
          width: 1,color: ColorManager.backgroundColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: ColorManager.white,
        )
      )
    ),
    );
  }
}