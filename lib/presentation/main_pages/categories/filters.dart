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
                       SizedBox(height: 5,),
                    Container(
                      height: AppHeight.h80,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SmallText(text: "Minimum",color: ColorManager.lightGrey,size: 15,),
                              SizedBox(height: 5,),
                              Container(
                                width: size.width*0.4,
                                height: 50,
                                child: const TextField(
                                  maxLength: 7,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(color: Colors.grey),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                      )
                                    )
                                  ),
                                  
                                ),
                              ),

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