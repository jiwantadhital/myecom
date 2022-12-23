import 'package:ecommerce/presentation/main_pages/home_pages/details/extra_details_widgets.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/all_products/bloc/all_products_bloc.dart';

class DescPart extends StatelessWidget {
  int index;
   DescPart({
    super.key,required this.index
  });

  @override
  Widget build(BuildContext context) {
          final cart = context.read<AllProductsBloc>().productRepository.productModel[index];
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediumText(text: cart.title,),
          SizedBox(height: AppHeight.h10,),
          Container(
            height: AppHeight.h20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                    RichText(text: TextSpan(
                                      children: [
                                          TextSpan(text: "4/5",style: TextStyle(
                                          color: ColorManager.boxText,fontSize: 15,
                                        ),
                                        ),
                                                                                WidgetSpan(child: Container(width: 2,)),
                                        WidgetSpan(child: Icon(Icons.star,color: ColorManager.buttonColor,size: 15,)),
                                      
                                      ],
                                    ),),
                                    SmallText(text: "Rs.4400",color: ColorManager.boxText,size: 15,weight: FontWeightManager.semibold,)
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 10,),
          Expanded(
            child: SmallText(text: "The descriptions are very clear Clothing (also known as clothes, apparel, and attire) are items worn on the body. Typically, clothing is made of fabrics or textiles, but over time it has included garments made from animal skin and other thin sheets of materials and natural products found in the environment, put together.Clothing (also known as clothes, apparel, and attire) are items worn on the body. Typically, clothing is made of fabrics or textiles, but over time it has included garments made from animal skin and other thin sheets of materials and natural products found in the environment, put together.",
            lines: 22,size: 15,
            color: ColorManager.grey,),
          )
        ],
      ),
    );
  }
}




class Specifications extends StatelessWidget {
  const Specifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      SizedBox(height: 10,),
      SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          Divider(),
          SpecificationName(specification: "Quality:",detail: "Medium",),
          Divider(),
          SpecificationName(specification: "Chipset:",detail: "Quantinum",),
          Divider(),
          SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          Divider(),
          SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          Divider(),
          SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          Divider(),
          SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          Divider(),
          SpecificationName(specification: "Color:",detail: "Red, blue, yellow",),
          Divider(),
        ],
      ),
    );
  }
}

class SpecificationName extends StatelessWidget {
  String specification;
  String detail;
  SpecificationName({required this.specification,required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.3,
          child: SmallText(text: specification,color: ColorManager.grey,)),
        SizedBox(width: 5,),
        Container(
         width: MediaQuery.of(context).size.width*0.6,
          child: SmallText(text: detail,color: ColorManager.grey,align: TextAlign.end,lines: 2,)),
      ],
    );
  }
}

class Reviews extends StatelessWidget {
  const Reviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            children: 
              [
                SizedBox(height: AppHeight.h10,),
                Center(child: SmallText(text: "4/5",color: ColorManager.boxText,size: 20,weight: FontWeightManager.semibold,)),
                SizedBox(height: AppHeight.h5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i=0;i<5;i++)
                Icon(Icons.star, color: ColorManager.buttonColor,),
                  ],
                ),
                Divider(),
                ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: ((context, index) {
                return Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(3),
                  height: 150,
                  child: Column(
                    children: [
                      Container(
                        height: AppHeight.h50,
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(width: 2,color: ColorManager.buttonColor),
                                image: DecorationImage(image: NetworkImage("https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg"))
                              ),
                            ),
                            SizedBox(width: AppWidth.w10,),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SmallText(text: "Julia Richard",color: ColorManager.boxText,size: 15,weight: FontWeightManager.semibold,),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(text: TextSpan(
                                        children: [
                                          WidgetSpan(child: Icon(Icons.star,color: ColorManager.buttonColor,size: 15,)),
                                          WidgetSpan(child: Container(width: 2,)),
                                          TextSpan(text: "4.0",style: TextStyle(
                                            color: ColorManager.boxText,fontSize: 12,
                                          )),
                                        ],
                                      ),),
                                      SmallText(text: "1 days ago",color: ColorManager.grey,size: 15,)
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: AppHeight.h5,),
                      Container(
                        padding: EdgeInsets.only(left: 5,right: 5),
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        child: SmallText(text: "The clothes are great and all but I cannot undrestand the fact that it was a littel darker,but overall I was really satisfied with the price and the time of delivery, it was perfectly on time and the service was good and I was really glad  ",
                        color: ColorManager.grey,size: 12,lines: 4,),
                      ),
                    ],
                  ),
                );
              })),
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        splashColor: Colors.black,
        backgroundColor: ColorManager.buttonColor,
        label: Text("Write a review"),
        onPressed: (){
           showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return CommentSheet(
                                                      
                                                      );
                                                    });
                                           
        }),
    );
  }
}



