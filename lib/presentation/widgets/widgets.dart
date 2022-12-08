
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
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_rounded, color: ColorManager.boxText,)),
          SizedBox(width: AppWidth.w20,),
          MediumText(text: text,),
        ],
      ),
    );
  }
}

class MediumText extends StatelessWidget {
   MediumText({
    Key? key,
    required this.text,
    this.colors = Colors.black,
  }) : super(key: key);

  final String? text;
  Color colors;

  @override
  Widget build(BuildContext context) {
    return Text(text??"",
    style: TextStyle(
      fontSize: FontSize.s22,
      fontWeight: FontWeightManager.medium,
      color: colors
    ),
    );
  }
}

class BigText extends StatelessWidget {
String text;
double size;
FontWeight weight;
Color colors;
BigText({required this.text, this.size = FontSize.s36, this.weight=FontWeightManager.bold, this.colors = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontSize: size,
      fontWeight: weight,
      fontFamily: FontConstants.fontFamily,
      color: colors
    ),
    );
  }
}
class SmallText extends StatelessWidget {
String text;
double size;
FontWeight weight;
Color color;
int lines;
TextAlign align;
SmallText({required this.text, this.size = FontSize.s16, this.weight=FontWeightManager.medium, this.color= Colors.white, this.lines = 1, this.align=TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    textAlign: align,
    overflow: TextOverflow.clip,
    maxLines: lines,
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
 double width;
 AuthenticationWidget({required this.text, this.color=Colors.white, this.textColor=Colors.black, this.width=double.maxFinite});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h60,
      width: width,
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
  bool hide = false;
  TextEditingController? controller;
  var changed;
  var validate;
  TextFieldHelp({required this.icon, required this.hintText, this.controller, this.backIcon, this.hide=false,this.changed, this.validate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      onChanged: changed,
      obscureText: hide,
      controller: controller,
      style: TextStyle(color: ColorManager.boxText),
      cursorColor: ColorManager.white,
    decoration: InputDecoration(
      filled: true,
      suffixIcon: Icon(backIcon, color: ColorManager.boxText,),
      hoverColor: ColorManager.white,
      fillColor: ColorManager.textFieldColor.withOpacity(0.2),
      prefixIcon: Icon(icon,color: ColorManager.boxText,), 
     hintText: hintText,
      hintStyle: TextStyle(
        color: ColorManager.boxText.withOpacity(0.5),
      ),
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(          
          width: 1,color: ColorManager.boxBorder,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: ColorManager.boxBorderGrey,
        )
      )
    ),
    );
  }
}


//birth date
class BirthDate extends StatelessWidget {
  const BirthDate({
    super.key,
    required this.selectedDate,
  });

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.textFieldColor.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p12),
            child: Icon(Icons.calendar_month_outlined, color: ColorManager.boxText,size: AppSize.s28,),
          ),
          SizedBox(width: AppWidth.w10,),
          SmallText(text: "${selectedDate.year.toString()}-${selectedDate.month.toString()}-${selectedDate.day.toString()}", color: ColorManager.boxText.withOpacity(0.5),)
        ],
      ),
    );
  }
}