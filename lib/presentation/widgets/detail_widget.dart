import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  IconData icons;
  Color backgroundColor;
  double? height;
  double? width;
  double iconSize;
  IconWidget({
    Key? key,
    required this.icons,
   required this.backgroundColor,
    this.height=AppHeight.h40,
    this.width=AppWidth.w40,
    this.iconSize=20
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Icon(icons,color: ColorManager.white,size: iconSize,),
    );
  }
}


//Add and subtract from cart
class AddSubtractWidget extends StatelessWidget {
IconData icons;
var tap;
double? height;
double? width;
double? iSize;
AddSubtractWidget({required this.icons, this.tap, this.height=30,this.width=30,this.iSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorManager.buttonColor
        ),
        child: Icon(icons,color: Colors.white,size: iSize,),
      ),
    );
  }
}