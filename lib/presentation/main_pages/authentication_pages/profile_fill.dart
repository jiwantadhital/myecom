import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileFill extends StatefulWidget {
  const ProfileFill({super.key});

  @override
  State<ProfileFill> createState() => _ProfileFillState();
}

class _ProfileFillState extends State<ProfileFill> {
  DateTime selectedDate = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                TopSection(text: "Fill Your Profile",tap: (){
                                Navigator.pop(context);
                },),
                SizedBox(height: AppHeight.h10,),
                Container(
                  height: MediaQuery.of(context).size.height*0.26,                
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: ColorManager.boxBorderGrey.withOpacity(0.4)
                  ),
                        child: Icon(Icons.person,color: ColorManager.backgroundColor.withOpacity(0.3),size: IconSize.i150,)),
                        Positioned(
                          top: MediaQuery.of(context).size.height*0.15,
                          left: MediaQuery.of(context).size.width*0.23,
                          child: Container(
                            height: AppHeight.h30,
                            width: AppWidth.w30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorManager.boxBorderGrey,
                            ),
                            child: Icon(Icons.edit_rounded, color: ColorManager.white,),
                          ),),
                    ],
                  ),
                ),
                TextFieldHelp(icon: Icons.person, hintText: "Full Name"),
                SizedBox(height: AppHeight.h10,),
                TextFieldHelp(icon: Icons.person, hintText: "NickName"),
                SizedBox(height: AppHeight.h10,),
                TextFieldHelp(icon: Icons.email, hintText: "Email"),
                SizedBox(height: AppHeight.h10,),
                GestureDetector(
                  onTap: (){
                    _selectDate(context);
                  },
                  child: BirthDate(selectedDate: selectedDate),
                ),
                SizedBox(height: AppHeight.h10,),
                TextFieldHelp(icon: Icons.phone, hintText: "Phone Number"),
                SizedBox(height: AppHeight.h10,),
                TextFieldHelp(icon: Icons.person, hintText: "Gender"),
                SizedBox(height: AppHeight.h20,),
                AuthenticationWidget(text: "Continue",color: ColorManager.boxBorderGrey,textColor: ColorManager.white,)
              ],
            ),
          ),
        ),
        ),
    );
  }
      Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

