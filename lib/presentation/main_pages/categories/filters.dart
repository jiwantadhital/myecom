import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
    int myIndex =0;

  double newValue=10;
  @override
  Widget build(BuildContext context) { 
    var size = MediaQuery.of(context).size;
    return Container(
                      height: MediaQuery.of(context).size.height*0.7,
                      padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: AppHeight.h5,
                        width: AppWidth.w80,
                        decoration: BoxDecoration(
                          color: ColorManager.boxText,
                          borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                    ),
                    const SizedBox(height: AppHeight.h20,),
                    BigText(text: "Choose Your Filters",colors: ColorManager.boxText,size: 25,weight: FontWeightManager.semibold,),
                    const SizedBox(height: AppHeight.h10,),
                    SmallText(text: "Price Range",color: ColorManager.boxText,weight: FontWeightManager.semibold,),
                    Container(
                      height: AppHeight.h60,
                      width: double.maxFinite,
                      child: Slider(
                        activeColor: ColorManager.buttonColor,
                        min: 1.00,
                        max: 200,
                        divisions: 10,
                        value: newValue,
                        onChanged: (val){
                          setState(() {
                            newValue=val;
                          });
                        })
                    ),
              SizedBox(height: AppHeight.h10,),
             SmallText(text: "Sort By",color: ColorManager.boxText,weight: FontWeightManager.semibold,),
             SizedBox(height: AppHeight.h10,),
             Container(
              height: AppHeight.h50,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                  return GestureDetector(
                      onTap: (){
                        myIndex=index;
                        setState(() {
                          
                        });
                      },
                    child: Container(
                      margin: EdgeInsets.only(left: 5,right: 5),
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:index==myIndex? Color.fromARGB(255, 23, 141, 27):ColorManager.white,
                        border: index==myIndex? Border.all(width: 2,color: ColorManager.buttonColor,):Border.all(width: 2),
                      ),
                      child: Center(child: SmallText(text: "Clothes",color: index==myIndex? Colors.white:ColorManager.buttonColor,size: 15,weight: FontWeightManager.semibold,)),
                    ),
                  );
                }),
             ),
              SizedBox(height: AppHeight.h10,),
             SmallText(text: "Rating",color: ColorManager.boxText,weight: FontWeightManager.semibold,),
             SizedBox(height: AppHeight.h10,),
             Container(
              height: AppHeight.h50,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                  return GestureDetector(
                      onTap: (){
                        myIndex=index;
                        setState(() {
                          
                        });
                      },
                    child: Container(
                      margin: EdgeInsets.only(left: 5,right: 5),
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:index==myIndex? Color.fromARGB(255, 23, 141, 27):ColorManager.white,
                        border: index==myIndex? Border.all(width: 2,color: ColorManager.buttonColor,):Border.all(width: 2),
                      ),
                      child: Center(child: SmallText(text: "5 star",color: index==myIndex? Colors.white:ColorManager.buttonColor,size: 15,weight: FontWeightManager.semibold,)),
                    ),
                  );
                }),
             ),
             SizedBox(height: AppHeight.h40,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: AppHeight.h60,
                  width: MediaQuery.of(context).size.width*0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorManager.lightGrey,
                  ),
                  child: Center(child: SmallText(text: "Reset",size: 20,weight: FontWeightManager.semibold,)),
                ),
                Container(
                  height: AppHeight.h60,
                  width: MediaQuery.of(context).size.width*0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorManager.buttonColor,
                  ),
                  child: Center(child: SmallText(text: "Apply",size: 20,weight: FontWeightManager.semibold,)),
                )
              ],
             )
                  ],
                ),
                    );
  }
}