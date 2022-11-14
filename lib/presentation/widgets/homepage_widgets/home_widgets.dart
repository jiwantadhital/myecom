import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SeeAllTexts extends StatelessWidget {
  String title;
  Function()? tap;
SeeAllTexts({required this.title, this.tap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      height: AppHeight.h20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(text: title,color: ColorManager.boxText,weight: FontWeight.w700,size: AppSize.s18,),
          GestureDetector(
            onTap: tap,
            child: SmallText(text: "See All",color: ColorManager.boxText,weight: FontWeight.w400,)),

        ],
      ),
    );
  }
}


