import 'dart:async';

import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:ecommerce/routes/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

@override
  void initState() {
    _startDelay();
    super.initState();
  }

    _startDelay(){
    _timer = Timer(Duration(seconds: 4), _goNext);
  }
  _goNext(){
    Navigator.pushReplacementNamed(context, Routes.social);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
      
             Container(
             height: MediaQuery.of(context).size.height*0.9,
             width: double.maxFinite,
             decoration: BoxDecoration(
               color: Colors.purple,
               borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight:  Radius.circular(100))
             ),
             child: ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.47,),
                Center(child: SmallText(text: "Speak less, Eat more",color: Colors.white,size: 25,weight: FontWeightManager.semibold,)),
                SizedBox(height: 20,),
                Center(child: SmallText(text: "Everything you want ,all at your door_step in your single tap",color: Colors.white,size: 15,weight: FontWeightManager.regular,align: TextAlign.center,lines: 2,)),
                SizedBox(height: 50,),
                SpinKitSpinningLines(
          color: Colors.white,
          size: 50.0,
                )   ,
              ],
             ),
            ),
            Positioned(
              top: 50,
              child: Container(
                height: MediaQuery.of(context).size.height*0.5,
                width: MediaQuery.of(context).size.width*0.90,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(image: AssetImage("assets/images/splash.png"),alignment: Alignment.bottomCenter)
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}

