import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:flutter/material.dart';

class CarouselPart extends StatefulWidget {
  const CarouselPart({
    Key? key,
  }) : super(key: key);

  @override
  State<CarouselPart> createState() => _CarouselPartState();
}

class _CarouselPartState extends State<CarouselPart> {

  int counts = 5;
  int currentcount = 1;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children:[CarouselSlider.builder(
              options: CarouselOptions(
               onPageChanged: (index,reason){
             currentcount = index;
              setState(() {
               
              });
          },
                aspectRatio: 16/8,
      viewportFraction: 1,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.ease,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
              ),
          itemCount: 3,
          itemBuilder: (BuildContext context,int index, int pageViewIndex) =>
           Container(
             height: 160,
             width: double.maxFinite,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s12),
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/3965548/pexels-photo-3965548.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  ),
                  fit: BoxFit.cover
                  ),
             ),

             ),
          ),
            Positioned(
    // top: size.width < 365? MediaQuery.of(context).size.height*0.20:size.width<400?MediaQuery.of(context).size.height*0.15:MediaQuery.of(context).size.height*0.22,
    left: MediaQuery.of(context).size.width*0.35,
    top: MediaQuery.of(context).size.height*0.18,
    child:  DotsIndicator(
        dotsCount: counts,
          position: currentcount.toDouble(),
        decorator: DotsDecorator(
          activeColor: ColorManager.boxText,
          color: ColorManager.lightGrey,
          size: const Size.square(8.0),
          activeSize: const Size(20.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    ),
      ]
    );
  }
}

class SliderPage extends StatelessWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
              options: CarouselOptions(
                aspectRatio: 16/8,
      viewportFraction: 1,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.ease,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
              ),
          itemCount: 3,
          itemBuilder: (BuildContext context,int index, int pageViewIndex) =>
           Container(
            margin: EdgeInsets.only(top: 10),
             height: 160,
             width: double.maxFinite,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s12),
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/3965548/pexels-photo-3965548.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  ),
                  fit: BoxFit.cover
                  ),
             ),

             ),
          );
  }
}
