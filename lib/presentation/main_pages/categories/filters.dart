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
  @override
  Widget build(BuildContext context) { 
    return Container(
                      height: MediaQuery.of(context).size.height*0.7,
                      padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
                decoration: BoxDecoration(
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
                    SizedBox(height: AppHeight.h20,),
                    BigText(text: "Choose Your Filters",colors: ColorManager.boxText,size: 25,weight: FontWeightManager.semibold,),
                    SizedBox(height: AppHeight.h10,),
                    SmallText(text: "Price Range",color: ColorManager.boxText,weight: FontWeightManager.semibold,),
                    Container(
                      height: AppHeight.h80,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SmallText(text: "Minimum",color: ColorManager.lightGrey,size: 15,)
                            ],
                          ),
                        ],
                      ),
                    )

                  ],
                ),
                    );
  }
}