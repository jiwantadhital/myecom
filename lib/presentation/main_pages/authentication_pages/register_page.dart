import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool ourValue = false;

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
                TopSection(tap: (){
                                Navigator.pop(context);
                },),
                BigText(text: "Register", colors: ColorManager.boxText,),
                SizedBox(height: AppHeight.h30,),
                TextFieldHelp(hintText: "Email",icon: Icons.email,),
                SizedBox(height: AppHeight.h20,),
                TextFieldHelp(icon: Icons.lock, hintText: "Password", backIcon: Icons.remove_red_eye_sharp,hide: true,),
                SizedBox(height: AppHeight.h15,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      checkColor: ColorManager.backgroundColor,
                      activeColor: ColorManager.white,
                      fillColor: MaterialStateProperty.all<Color>(Colors.black),
                      value: ourValue,
                       onChanged: (val){
                        setState(() {
                         ourValue==false?ourValue=true:ourValue=false;
                        });
                       }),
                       SmallText(text: "Remember me", weight: FontWeightManager.medium,color: ColorManager.boxText,)
                  ],
                ),
                SizedBox(height: AppHeight.h20,),
                AuthenticationWidget(text: "Sign Up", color: ColorManager.boxBorderGrey,textColor: ColorManager.white,),
               SizedBox(height: AppHeight.h20,),
               SmallText(text: "Forgot PassWord ?", size: AppSize.s14,color: ColorManager.boxText,),
               SizedBox(height: AppHeight.h30,),
               Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.28,
                        child: Divider(height: 1,thickness: 1,color: ColorManager.grey,)),
                      SmallText(text: "or continue with", color: ColorManager.boxText,),
                      SizedBox(width: MediaQuery.of(context).size.width*0.28,
                        child: Divider(height: 1,thickness: 1,color: ColorManager.grey,)),
                    ],
                  ),
                  SizedBox(height: AppHeight.h30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SignWith(image: "assets/images/face.png",),
                      SignWith(image: "assets/images/goog.png",),
                      SignWith(image: "assets/images/appl.png",),
                    ],
                  ),
                  SizedBox(height: AppHeight.h30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(text: "Already have an account? ", color: ColorManager.boxText,),
                      SmallText(text: "Sign In", color: Colors.blue,),
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

class SignWith extends StatelessWidget {
String image;
SignWith({required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h60,
      width: AppWidth.w80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManager.boxBorderGrey),
      ),
      child: Image.asset(image,scale: 3.5,),
    );
  }
}

