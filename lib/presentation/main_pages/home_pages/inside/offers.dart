import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          onPageChanged: (index,reason){
          },
          aspectRatio: 10/3,
          viewportFraction: 1,
          enableInfiniteScroll: false
        ),
         itemCount: 3,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
        Container(
          margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      image: DecorationImage(image: NetworkImage("https://icms-image.slatic.net/images/ims-web/9804f956-cd83-4a75-b0cf-39cced4b2ba7.jpg"),fit: BoxFit.cover)
            ),
    ),
);
  }
}

