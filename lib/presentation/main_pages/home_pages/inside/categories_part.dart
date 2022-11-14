import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CategoriesPart extends StatelessWidget {
  const CategoriesPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     height: AppHeight.h150,
     child: ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount: 10,
       itemBuilder: ((context, index) {
       return Column(
         children: [
           Container(
             margin: EdgeInsets.only(left: 10),
             height: AppHeight.h100,
             width: AppWidth.w100,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(50),
               color: ColorManager.white,
               border: Border.all(width: AppWidth.w10,color: ColorManager.white),
               image: DecorationImage(image: NetworkImage("https://m.media-amazon.com/images/G/31/img21/Watches2021/May/XCM/SBC/M/SBC-Hex-new-watches-m_02._CB636514486_.jpg"),fit: BoxFit.cover)
             ),
           ),
           SizedBox(height: AppHeight.h5,),
           Container(
            width: AppWidth.w80,
            height: AppHeight.h25,
             child: Center(child: SmallText(text: "Watch", color: ColorManager.boxText,size: 15,lines: 2,weight: FontWeightManager.semibold,)))
         ],
       );
     })),
    );
  }
}



