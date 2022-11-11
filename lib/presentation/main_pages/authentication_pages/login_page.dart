import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                TopSection(),
                BigText(text: "Login"),
                SizedBox(height: AppHeight.h30,),
                TextFieldHelp(hintText: "Email",icon: Icons.email,),
                SizedBox(height: AppHeight.h20,),
                TextFieldHelp(icon: Icons.lock, hintText: "Password", backIcon: Icons.remove_red_eye_sharp,),
                SizedBox(height: AppHeight.h15,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      checkColor: ColorManager.backgroundColor,
                      activeColor: ColorManager.white,
                      fillColor: MaterialStateProperty.all<Color>(Colors.white),
                      value: ourValue,
                       onChanged: (val){
                        setState(() {
                         ourValue==false?ourValue=true:ourValue=false;
                        });
                       }),
                       SmallText(text: "Remember me", weight: FontWeightManager.medium,)
                  ],
                ),
                SizedBox(height: AppHeight.h20,),
                AuthenticationWidget(text: "Sign in", color: ColorManager.boxBorderGrey,textColor: ColorManager.white,),
               SizedBox(height: AppHeight.h20,),
               SmallText(text: "Forgot PassWord ?", size: AppSize.s14,),
               SizedBox(height: AppHeight.h30,),
               Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.29,
                        child: Divider(height: 1,thickness: 1,color: ColorManager.white,)),
                      SmallText(text: "or continue with"),
                      SizedBox(width: MediaQuery.of(context).size.width*0.29,
                        child: Divider(height: 1,thickness: 1,color: ColorManager.white,)),
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
                      SmallText(text: "Don't have an account? "),
                      SmallText(text: "Sign Up", color: Colors.blue,),
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
        border: Border.all(color: ColorManager.white.withOpacity(0.2)),
      ),
      child: Image.asset(image,scale: 3.5,),
    );
  }
}

