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





class CategoryPart extends StatelessWidget {
  const CategoryPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h150,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
      itemBuilder: ((BuildContext context, index) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: AppSize.s12,right: AppSize.s12,top: AppSize.s8),
              height: AppHeight.h100,
              width: AppWidth.w100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s40),
                color: ColorManager.lightGrey,
                border: Border.all(width: AppWidth.w8,color: ColorManager.white.withOpacity(0.9)),
                image: DecorationImage(image: NetworkImage(
                  "https://image.shutterstock.com/image-vector/black-friday-vector-banner-poster-260nw-1836689074.jpg"
                ),
                fit: BoxFit.cover
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1,3),
                    blurRadius: 3,
                    color: ColorManager.lightGrey
                  )
                ]
              ),
            ),
            SizedBox(
              height: AppSize.s8,
            ),
            Container(
              height: AppHeight.h25,
              width: 120,
              child: Center(child: SmallText(text:"Purse",weight: FontWeight.w200,color: ColorManager.boxText,)),
            ),
          ],
        );
      })
      ),
    );
  }
}