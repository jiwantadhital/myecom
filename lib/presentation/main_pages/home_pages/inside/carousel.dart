import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
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
      children:[ CarouselSlider.builder(
        options: CarouselOptions(
          onPageChanged: (index,reason){
             currentcount = index;
              setState(() {
               
              });
          },
          viewportFraction: 1,
          autoPlay: true
        ),
         itemCount: counts,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
        Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(image: NetworkImage("https://m.media-amazon.com/images/G/31/selldot/Images/WebpImages/BannerImage-PopularcategoriestoSellOnline.webp"),fit: BoxFit.cover)
            ),
    ),
),
            Positioned(
    top: size.width < 365? MediaQuery.of(context).size.height*0.22:MediaQuery.of(context).size.height*0.27,
    left: MediaQuery.of(context).size.width*0.35,
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