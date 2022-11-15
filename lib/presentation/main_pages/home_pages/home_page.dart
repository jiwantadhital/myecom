import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/inside/carousel.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/inside/categories_part.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/inside/offers.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/inside/recommended.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/homepage_widgets/home_widgets.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.textFieldColor.withOpacity(0.2),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
            padding: EdgeInsets.only(left: AppPadding.p20,right: AppPadding.p20),
            margin: EdgeInsets.only(top: AppMargin.m10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                  },
                  child: Icon(
                    Icons.notifications,
                    size: IconSize.i28,
                    color: ColorManager.primary,
                    ),
                ),
                  SizedBox(width: AppWidth.w8,),
                MediumText(
                  text:"HomePage",
                ),
                SizedBox(width: AppWidth.w8,),
                GestureDetector(
                  onTap: (){
                  },
                  child: Icon(
                    Icons.favorite,
                    size: IconSize.i28,
                    color: ColorManager.primary,
                    ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppHeight.h20,),
               Container(
            padding: EdgeInsets.only(left: AppPadding.p10,right: AppPadding.p20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white
                    ),
                    child:   TextField(
                      cursorColor: Color.fromRGBO(255, 141, 13, 1),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: ColorManager.primary,
                          size: IconSize.i25,
                          ),
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.black26,fontSize: 10)
                      ),
                      // onChanged: _onSearchTextChanged,
                    ),
                  ),
                ),
                SizedBox(width: AppWidth.w12,),
                Container(
                  width: AppWidth.w50,
                  height: AppHeight.h50,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: ColorManager.white,
                  ),
                  child:  Icon(
                    Icons.list,
                    color: ColorManager.darkGrey,
                    ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppHeight.h10,),
          Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: AppHeight.h15,),
                  CarouselPart(),
                  SizedBox(height: AppHeight.h20,),
                   SeeAllTexts(title: "Categories",),
                   SizedBox(height: AppHeight.h10,),
                   CategoriesPart(),
                   SizedBox(height: AppHeight.h10,),
                   SeeAllTexts(title: "Recommended"),
                   SizedBox(height: AppHeight.h10,),
                   Recommended(),
                   SizedBox(height: AppHeight.h20,),
                   SpecialOffers(),
                     SizedBox(height: AppHeight.h20,),
                    SeeAllTexts(title: "Most Popular"),
                    SizedBox(height: AppHeight.h30,),
                    Container(
                      height: 1000,
                      child: GridView.builder(  
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,  
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
                      crossAxisCount: 2,  
                      crossAxisSpacing: 20.0,  
                      childAspectRatio: 0.75,
                      mainAxisSpacing: 9.0
                    ),  
                    itemBuilder: (BuildContext con, int index){  
                      return Container(
                        decoration: BoxDecoration(
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: AppHeight.h200,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 6,color: ColorManager.white),
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(image: NetworkImage("https://www.savethestudent.org/uploads/Online-fashion-retailers.jpg"),fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              left: 120,
                              child: Container(
                              height: AppHeight.h80,
                              width: AppWidth.w80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white
                              ),
                            ))
                          ],
                        ),
                      );
                  },  
                    ),
                    ),
                ],
              ),
            ),
          ),
          ],
        ),
      )),
    );
  }
}

