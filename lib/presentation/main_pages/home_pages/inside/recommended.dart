import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  const Recommended({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     height: MediaQuery.of(context).size.height*0.32,
     child: ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount: 5,
       itemBuilder: ((context, index) {
       return Container(
         margin: EdgeInsets.only(left: 10),
         width: AppWidth.w190,
         decoration: BoxDecoration(
            boxShadow: [
                   BoxShadow(
                     blurRadius: 6,
                     offset: Offset(-2,0),
                     color: ColorManager.textFieldColor,
                   )
                 ],
           borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
           color: ColorManager.white
         ),
         child: Column(
           children: [
             Container(
               margin: EdgeInsets.only(left: 10,right: 10,top: 10),
               height: AppHeight.h160,
               decoration: BoxDecoration(
                
                 borderRadius: BorderRadius.circular(10),
                 image: DecorationImage(image: NetworkImage("https://cdn.pocket-lint.com/r/s/485x/assets/images/159747-phones-review-hands-on-vivo-v23-color-changing-mobile-phone-image7-acjviqsuf1.jpg"),fit: BoxFit.cover)
               ),
             ),
             SizedBox(height: AppHeight.h5,),
             Container(
               width: AppWidth.w150,
               child: Center(child: SmallText(text: "Vivo super 8", color: ColorManager.boxText,weight: FontWeightManager.semibold,)),
             ),
             Padding(
               padding: const EdgeInsets.all(2.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     width: AppWidth.w50,
                     child: RichText(text: TextSpan(
                       children: [
                         WidgetSpan(child: Icon(Icons.star, color: Colors.yellow,),),
                         WidgetSpan(child: SmallText(text: "3.5",color: ColorManager.boxText,))
                       ],
                     )),
                   ),
                   Container(
                     width: AppWidth.w100,
                     child: SmallText(text: "Rs 4400000", color: ColorManager.boxText,align: TextAlign.end,),
                   ),
                 ],
               ),
             ),
           ],
         ),
       );
     })),
    );
  }
}

