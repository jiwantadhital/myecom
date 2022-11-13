import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {

  double width1 = 2;
  double width2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(AppMargin.m10),
          child: Column(
            children: [
              TopSection(text: "Forgot Password",),
              SizedBox(height: AppHeight.h20,),
              Container(
                height: MediaQuery.of(context).size.height*0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/contact.png"))
                ),
              ),
              SizedBox(height: AppHeight.h20,),
              SmallText(text: "Select which contact detail should we use to reset your password.", color: ColorManager.boxText,lines: 2,),
              SizedBox(height: AppHeight.h10,),
              ContactSelectionBox(icon: Icons.message,via: "via sms",contact: "9827261821",tap: (){

                if(width1==0){
                  width1 = 2;
                  width2 = 0;
                  setState(() {
                    
                  });
                }

              },border: Border.all(width: width1,color: ColorManager.grey),),
              SizedBox(height: AppHeight.h10,),
              ContactSelectionBox(icon: Icons.message,via: "via email",contact: "dagatahaoaras@gmail.com",border: Border.all(width: width2,color: ColorManager.grey),
              tap: (){

                if(width2==0){
                  width2 = 2;
                  width1=0;
                  setState(() {
                    
                  });
                }

              },),
              SizedBox(height: AppHeight.h30,),
              AuthenticationWidget(text: "Continue",color: ColorManager.buttonColor,textColor: ColorManager.white,)
            ],
          ),
        ),
      ),
    );
  }
}

class ContactSelectionBox extends StatelessWidget {
  IconData icon;
  String via;
  String contact;
  void Function() tap;
  Border? border;
  ContactSelectionBox({required this.icon, required this.via, required this.contact, required this.tap,  this.border});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: MediaQuery.of(context).size.height*0.16,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.textFieldColor.withOpacity(0.1),
        ),
        child: Row(
          children: [
            SizedBox(width: AppWidth.w20,),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: ColorManager.textFieldColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(icon, size: AppSize.s40,),
            ),
            SizedBox(width: AppWidth.w20,),
            Padding(
              padding: const EdgeInsets.only(top:30),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: SmallText(text: via, color: ColorManager.lightGrey,)),
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: SmallText(text: contact, color: ColorManager.boxText,))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}