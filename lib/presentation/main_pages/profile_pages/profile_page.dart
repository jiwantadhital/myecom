import 'dart:ui';

import 'package:ecommerce/local_database/shared_prefs.dart';
import 'package:ecommerce/logic/user_detail/bloc/user_detail_bloc.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:ecommerce/routes/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

final riveFile = "assets/images/darkn.riv";
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late RiveAnimationController _controller;
    Artboard? _artboard;
    bool tvalue = false;
    @override
  void initState() {
   _loadRive();
    super.initState();
  }

   void _loadRive()async{
    final bytes = await rootBundle.load(riveFile);
    RiveFile rFile = RiveFile.import(bytes);
    setState(() => _artboard = rFile.mainArtboard..addController(
        _controller = SimpleAnimation("light")
      ));
   }
   void _onSuccess(){
    _artboard!.artboard.removeController(_controller);
    _artboard!.addController(SimpleAnimation('dark'));
    setState(() {
      
    });
   }
   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightGrey.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        title: Center(child: SmallText(text: "Profile",color: ColorManager.buttonColor,weight: FontWeightManager.semibold,size: 20,),),
      ),
      body: Stack(
        children: [
      _artboard != null? Rive(artboard: _artboard!):Container(),
          BackdropFilter(filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: SizedBox(),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width*0.4,
                    width: double.maxFinite,
                    child:
                    BlocBuilder<UserDetailBloc,UserDetailState>(builder: (context,state){
                           if(state is UserDetailLoading){
                            return Center(child: CircularProgressIndicator());
                           }
                           if(state is UserDetailGot){
                            return  Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 7,color: ColorManager.white),
                            image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2WPSnSP44UbxEKVUsVg8AT2Sf43whBNwsHw&usqp=CAU"),fit: BoxFit.cover)
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: MediaQuery.of(context).size.width*0.53,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorManager.buttonColor
                            ),
                            child: Icon(Icons.edit,color: ColorManager.white,size: 15,),
                          ),
                          ),
            
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SmallText(text: state.userModel.data!.name??"User Name",color: ColorManager.boxText,weight: FontWeightManager.bold,),
                                SmallText(text: state.userModel.data!.phone??"Phone Number",color: ColorManager.boxText,weight: FontWeightManager.regular,),
                              ],
                            ))
                      ],
                    );
                           }
                           return  Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 7,color: ColorManager.white),
                            image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2WPSnSP44UbxEKVUsVg8AT2Sf43whBNwsHw&usqp=CAU"),fit: BoxFit.cover)
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: MediaQuery.of(context).size.width*0.53,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorManager.buttonColor
                            ),
                            child: Icon(Icons.edit,color: ColorManager.white,size: 15,),
                          ),
                          ),
            
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SmallText(text: "Subin Subedi",color: ColorManager.boxText,weight: FontWeightManager.bold,),
                                SmallText(text: "9815261522",color: ColorManager.boxText,weight: FontWeightManager.regular,),
                              ],
                            ))
                      ],
                    );
                           }),
                    
                  ),
                  SizedBox(height: AppHeight.h30,),
                  Column(
                    children: [
                      ProfileBoxes(fIcon: Icons.person,sIcon: Icons.arrow_forward_ios,boxText: "Edit Profile",),
                      SizedBox(height: AppHeight.h10,),
                      ProfileBoxes(fIcon: Icons.location_history,sIcon: Icons.arrow_forward_ios,boxText: "Address",),
                      SizedBox(height: AppHeight.h10,),
                      ProfileBoxes(fIcon: Icons.person,sIcon: Icons.arrow_forward_ios,boxText: "Customer Service",),
                      SizedBox(height: AppHeight.h10,),
                      ProfileBoxes(fIcon: Icons.error,sIcon: Icons.arrow_forward_ios,boxText: "Report a problem",),
                      SizedBox(height: AppHeight.h10,),
                      ProfileBoxes(fIcon: Icons.notifications,sIcon: Icons.arrow_forward_ios,boxText: "Notifications",),
                      SizedBox(height: AppHeight.h10,),
                      ProfileToggle(fIcon: Icons.remove_red_eye,button: Switch(
                        activeColor: ColorManager.buttonColor,
                        value: tvalue, onChanged: (val){
                           tvalue=val;
                           val == false? _loadRive():_onSuccess();
                          setState(() {
                           
                          });
                        }),boxText: "Dark Mode",),
                      SizedBox(height: AppHeight.h10,),
                      ProfileBoxes(fIcon: Icons.share,sIcon: Icons.arrow_forward_ios,boxText: "Invite",),
                      SizedBox(height: AppHeight.h10,),
                     UserSimplePreferences.userLoggedIn()? ProfileBoxes(fIcon: Icons.logout,boxText: "Logout",color: Colors.red,
                      tap: (){
                        showModalBottomSheet<void>(
                              isScrollControlled: true,
                              enableDrag: true,
                        context: context,
                        builder: (BuildContext context) {
                         return Container(
                              height: 150,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                                color: ColorManager.white
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  SmallText(text: "Logout",color: Colors.red,size: 20,),
                                                                SizedBox(height: 10,),
                                  SmallText(text: "Are you sure you want to logout?",color: Colors.black,size: 15,),
                                                                SizedBox(height: 20,),
                                       Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: AppHeight.h40,
                      width: MediaQuery.of(context).size.width*0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorManager.lightGrey,
                      ),
                      child: Center(child: SmallText(text: "Cancel",size: 15,weight: FontWeightManager.semibold,)),
                    ),
                    GestureDetector(
                      onTap: (){
                        UserSimplePreferences.logout();
                        Navigator.pushNamed(context, Routes.bottomBarRoute);
                        context.read<UserDetailBloc>()..add(UserDetailData());
                      },
                      child: Container(
                        height: AppHeight.h40,
                        width: MediaQuery.of(context).size.width*0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorManager.buttonColor,
                        ),
                        child: Center(child: SmallText(text: "Yes",size: 15,weight: FontWeightManager.semibold,)),
                      ),
                    )
                  ],
                 )
                                ],
                              ),
                            );
                      },
                        );
                        
                      },
                      ):Container(),
                      SizedBox(height: AppHeight.h10,),
                    
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  doNothing(){}
}

class ProfileBoxes extends StatelessWidget {
IconData fIcon;
IconData? sIcon;
String boxText;
Color color;
void Function()? tap;
ProfileBoxes({required this.boxText,required this.fIcon,  this.sIcon, this.color=Colors.black, this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: SizedBox(
        height: AppHeight.h40,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(fIcon),
                SizedBox(width: 20,),
                SmallText(text: boxText, color: color,size: 18,)
              ],
            ),
            Icon(sIcon)
          ],
        ),
      ),
    );
  }
}

class ProfileToggle extends StatelessWidget {
IconData fIcon;
IconData? sIcon;
String boxText;
Color color;
Widget button;
ProfileToggle({required this.boxText,required this.fIcon, required this.button, this.color=Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h40,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(fIcon),
              SizedBox(width: 20,),
              SmallText(text: boxText, color: color,size: 18,)
            ],
          ),
          button
        ],
      ),
    );
  }
}