import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:ecommerce/routes/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(AppMargin.m10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                // TopSection(),
                Container(
                  height: MediaQuery.of(context).size.height*0.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/front.png"
                      )
                    )
                  ),
                ),
                SizedBox(height: 10,),
                BigText(text: "Let's you in", colors: ColorManager.boxText,),
                SizedBox(height: AppHeight.h10,),
                SocialBox(icon: "assets/images/face.png",text: "Continue with Facebook",),
                SizedBox(height: AppSize.s10,),
                SocialBox(icon: "assets/images/goog.png",text: "Continue with Google",),
                SizedBox(height: AppSize.s10,),
                SocialBox(icon: "assets/images/appl.png",text: "Continue with Apple",),
                SizedBox(height: AppHeight.h20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width*0.43,
                      child: Divider(height: 1,thickness: 1,color: ColorManager.boxText,)),
                    SmallText(text: "or", color: ColorManager.boxText,),
                    SizedBox(width: MediaQuery.of(context).size.width*0.43,
                      child: Divider(height: 1,thickness: 1,color: ColorManager.boxText,)),
                  ],
                ),
                SizedBox(height: AppHeight.h20,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.loginRoute);
                  },
                  child: AuthenticationWidget(text: "Sign in with password",color: ColorManager.buttonColor,textColor: ColorManager.white,)),
                SizedBox(height: AppHeight.h30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(text: "Don't have an account?", color: ColorManager.boxText,),
                    SizedBox(width: AppWidth.w10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.registerRoute);
                      },
                      child: SmallText(text: "Click here",size: AppSize.s14,color: Colors.blue,)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class SocialBox extends StatelessWidget {
String text;
String icon;
SocialBox({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: ColorManager.boxBorderGrey,),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.08,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(icon),
              ),
            ),
          ),
          SizedBox(width: AppWidth.w20,),
          Text(text,
          style: TextStyle(
            fontSize: AppSize.s16,
            fontWeight: FontWeightManager.semibold,
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.boxText
          ),
          )
        ],
      ),
    );
  }
}


