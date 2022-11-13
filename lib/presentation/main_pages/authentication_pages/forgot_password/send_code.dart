import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SendCode extends StatefulWidget {
  const SendCode({super.key});

  @override
  State<SendCode> createState() => _SendCodeState();
}

class _SendCodeState extends State<SendCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(AppMargin.m10),
          child: Column(
            children: [
              TopSection(text: "Forgot Password",),
              SizedBox(height: AppHeight.h40,),
              SmallText(text: "Code has been sent to: 9818172817", color: ColorManager.boxText,),
              SizedBox(height: AppHeight.h20,),
              Container(
                height: MediaQuery.of(context).size.height*0.25,
                color: Colors.black,
              )
            ],
          ),
        ),
        ),
    );
  }
}