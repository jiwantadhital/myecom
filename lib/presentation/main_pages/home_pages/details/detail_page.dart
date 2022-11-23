// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/widgets/detail_widget.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/values.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int theNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Column(
        children: [
          Container(
            height: 400,
            color: Colors.black,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(image: NetworkImage("https://www.savethestudent.org/uploads/Online-fashion-retailers.jpg"),fit: BoxFit.cover),

                    ),
                  ),
                  ),
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: IconWidget(icons: Icons.arrow_back,backgroundColor: ColorManager.buttonColor.withOpacity(0.6))),
                        Stack(
                          children: [
                            IconWidget(icons: Icons.shopping_cart,backgroundColor: ColorManager.buttonColor.withOpacity(0.6)),
                            Positioned(child: Container(
                              margin: EdgeInsets.only(top: 35,left: 40),
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: SmallText(text: "3".toString(), color: ColorManager.buttonColor,size: 10,weight: FontWeight.bold,)),
                            ))
                          ],
                        ),
                      ],
                    ),
                    ),
                    Stack(
            children: [
              Positioned(
                 top: 280,left: 0,right: 0,
                child: Container(
                  padding: EdgeInsets.only(top: 15,left: 20,right: 20),
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    color: ColorManager.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediumText(text: "Super Shiny 32"),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.star,color: Colors.purple,),
                                SizedBox(width: 5,),
                                SmallText(text: "3/4 Stars",color: ColorManager.boxText,weight: FontWeightManager.semibold,size: 15,),
                              ],
                            ),
                          ),
                          SmallText(text: "Rs 44000",color: ColorManager.boxText,weight: FontWeightManager.semibold,size: 15,),

                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(text: "Description",color: ColorManager.boxText,weight: FontWeightManager.semibold,),
                          Container(
                            height: 20,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorManager.buttonColor
                            ),
                            child: Center(child: SmallText(text: "More Details",size: 10,weight: FontWeightManager.semibold,)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
              ],
            ),
          ),
                   Expanded(
                     child: SingleChildScrollView(
                       child: Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        height: 250,
                        child: SmallText(
                          align: TextAlign.justify,
                          text: "Products tailored and designed to address the distinct needs of many different environments can be spotted rolling through the corridors of hospitals, hotels, sports stadiums. Products tailored and designed to address the distinct needs of many different environments can be spotted rolling through the corridors of hospitals, hotels, sports stadiums. Products tailored and designed to address the distinct needs of many different environments can be spotted rolling through the corridors of hospitals, hotels, sports stadiums. Products tailored and designed to address the distinct needs of many different environments can be spotted rolling through the corridors of hospitals, hotels, sports stadiums. Products tailored and designed to address the distinct needs of many different environments can be spotted rolling through the corridors of hospitals, hotels, sports stadiums. Products tailored and designed to address the distinct needs of many different environments can be spotted rolling through the corridors of hospitals, hotels, sports stadiums",color: ColorManager.grey,size: 12,lines: 16,),
                       ),
                     ),
                   ),

        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width*0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: AppHeight.h30,
                    width: AppWidth.w30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManager.buttonColor
                    ),
                    child: InkWell(
                      onTap: decreament,
                      child: Icon(Icons.remove,color: ColorManager.white,)),
                  ),
                  Container(
                    height: AppHeight.h30,
                    width: AppWidth.w30,
                    decoration: BoxDecoration(
                      color: ColorManager.white
                    ),
                    child: Center(child: SmallText(text: theNumber.toString(), color: ColorManager.boxText,size: 20,weight: FontWeight.bold,)),
                  ),
                  Container(
                    height: AppHeight.h30,
                    width: AppWidth.w30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManager.buttonColor
                    ),
                    child: InkWell(
                       onTap: increament,
                      child: Icon(Icons.add,color: ColorManager.white,)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorManager.buttonColor
              ),
              child: Center(child: SmallText(text: "Continue",color: ColorManager.white,weight: FontWeight.bold,)),
            )
          ],
        ),
      ),
    );
  }

 void increament(){
     setState(() {
       theNumber++;
     });
  }
  void decreament(){
      setState(() {
       theNumber--;
     });
  }
}

