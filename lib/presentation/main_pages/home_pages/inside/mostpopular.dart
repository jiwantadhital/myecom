import 'package:animations/animations.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/details/detail_page.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({
    Key? key,
  }) : super(key: key);

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: GridView.builder(  
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,  
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
            crossAxisCount: 2,  
            crossAxisSpacing: 10.0,  
            childAspectRatio: 0.7,
            mainAxisSpacing: 9.0
              ),  
              itemBuilder: (BuildContext con, int index){  
              return  Container(
              decoration: BoxDecoration(
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: AppHeight.h200,
                          decoration: BoxDecoration(
                            border: Border.all(width: 6,color: ColorManager.white),
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: NetworkImage("https://www.savethestudent.org/uploads/Online-fashion-retailers.jpg"),fit: BoxFit.cover),
                          ),
                        ),
                      ),
                       SizedBox(height: AppHeight.h5,),
                   Container(
                     width: AppWidth.w150,
                     child: Center(child: SmallText(text: "Super Shiny 32", color: ColorManager.boxText,weight: FontWeightManager.semibold,)),
                   ),
                    ],
                  ),
                  Positioned(
                    left: 90,
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                      height: AppHeight.h80,
                      width: AppWidth.w80,
                      decoration: BoxDecoration(
                        border: Border.all(width: 6,color: ColorManager.white),
                        borderRadius: BorderRadius.circular(100),
                        color: ColorManager.buttonColor
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SmallText(text: "Rs", color: ColorManager.white,size: 15,weight: FontWeightManager.semibold,),
                          SmallText(text: "440", color: ColorManager.white,size: 10,weight: FontWeightManager.semibold,),
                        ],
                      )),
                                ),
                    ))
                ],
              ),
            );
              },
            )
              )
        ]
      )
    );
              }
               
          
    


}