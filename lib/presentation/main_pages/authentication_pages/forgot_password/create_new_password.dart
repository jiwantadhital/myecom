import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                TopSection(text: "Create New Password",),
                SizedBox(height: AppHeight.h10,),
                Container(
                  height: MediaQuery.of(context).size.height*0.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/newpassword.png")
                    )
                  ),
                ),
                SizedBox(height: AppHeight.h20,),
                SmallText(text: "Create Your New Password", color: ColorManager.boxText,),
                SizedBox(height: AppHeight.h40,),
                TextFieldHelp(icon: Icons.lock, hintText: "New Password",hide: true,),
                SizedBox(height: AppHeight.h20,),
                TextFieldHelp(icon: Icons.lock, hintText: "Repeat Password",hide: true,),
                SizedBox(height: AppHeight.h60,),
                GestureDetector(
                  onTap: (){
                       QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Congratulation',
          );
                  },
                  child: AuthenticationWidget(text: "Continue", color: ColorManager.buttonColor,textColor: ColorManager.white,))
              ],
            ),
          ),
        )),
    );
  }
}