import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class FingerPrint extends StatefulWidget {
  const FingerPrint({super.key});

  @override
  State<FingerPrint> createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              TopSection(text: "Set your fingerprint",),
              SizedBox(height: AppHeight.h40,),
              SmallText(text: "Add fingerprint to make your account more secure.",color: ColorManager.boxText,weight: FontWeightManager.light,),
              SizedBox(height: AppHeight.h40,),
              GestureDetector(
                onTap: (){
                  QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Congratulation',
          );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  child: Icon(Icons.fingerprint, size: 250,),
                ),
              ),
              SizedBox(height: AppHeight.h60,),
              SmallText(text: "Please put your finger on fingerprint to get started.",color: ColorManager.boxText,weight: FontWeightManager.light,),
              SizedBox(height: AppHeight.h40,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   AuthenticationWidget(text: "Skip", width: MediaQuery.of(context).size.width*0.45,color: ColorManager.lightGrey,textColor: ColorManager.white,),
                   AuthenticationWidget(text: "Continue", width: MediaQuery.of(context).size.width*0.45,color: ColorManager.buttonColor,textColor: ColorManager.white),
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
    );
  }
}