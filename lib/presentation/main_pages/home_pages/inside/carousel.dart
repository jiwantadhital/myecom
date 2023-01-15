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
      alignment: Alignment.bottomCenter,
      children:[CarouselSlider.builder(
              options: CarouselOptions(
               onPageChanged: (index,reason){
             currentcount = index;
              setState(() {
               
              });
          },
                aspectRatio: 16/7,
      viewportFraction: 1,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      // autoPlayCurve: Curves.ease,
      // enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
              ),
          itemCount: counts,
          itemBuilder: (BuildContext context,int index, int pageViewIndex) =>
           Container(
             height: 140,
             width: double.maxFinite,
             decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://www.sastodeal.com/media/weltpixel/owlcarouselslider/images/g/r/group_3_1.jpg",
                  ),
                  fit: BoxFit.cover
                  ),
             ),

             ),
          ),
            Positioned(
    // // top: size.width < 365? MediaQuery.of(context).size.height*0.20:size.width<400?MediaQuery.of(context).size.height*0.15:MediaQuery.of(context).size.height*0.22,
    // left: MediaQuery.of(context).size.width*0.35,
    // top: MediaQuery.of(context).size.height*0.22,
    child:  DotsIndicator(
        dotsCount: counts,
          position: currentcount.toDouble(),
        decorator: DotsDecorator(
          activeColor: Colors.purple,
          color: ColorManager.white,
          size: const Size.square(4.0),
          activeSize: const Size(20.0, 4.0),
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
