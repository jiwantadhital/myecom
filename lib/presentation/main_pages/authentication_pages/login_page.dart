import 'package:ecommerce/local_database/shared_prefs.dart';
import 'package:ecommerce/logic/bloc/login_bloc.dart';
import 'package:ecommerce/presentation/base/custom_snackbar.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:ecommerce/routes/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final _formKey = GlobalKey<FormState>(); 
  var emailController = TextEditingController(text:UserSimplePreferences.getEmail()?? "");
  var passwordController = TextEditingController(text: UserSimplePreferences.getEmail()??"");
  bool ourValue = false;
  bool active = false;
  bool obscureText = true;
@override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
 print(UserSimplePreferences.getToken());
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: BlocConsumer<LoginBloc,LoginState>(builder: (context,state){
            return Container(
          margin: EdgeInsets.all(AppMargin.m10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TopSection(tap: (){
                  Navigator.pop(context);
                  },),
                  BigText(text: "Login", colors: ColorManager.boxText,),
                  SizedBox(height: AppHeight.h30,),
                  TextFieldHelp(hintText: "Email",icon: Icons.email,hide:false,controller: emailController,
                  validate: (val){
                    
                  },
               
                  ),
                  SizedBox(height: AppHeight.h20,),
                  TextFieldHelp(
                    forPassword: (){
                       setState(() {
                           obscureText==false?obscureText=true:obscureText=false;
                          });
                    },
                    icon: Icons.lock, hintText: "Password", backIcon:obscureText==true?Icons.remove_red_eye_rounded: Icons.remove_red_eye_outlined,hide: obscureText,controller: passwordController,
                  changed: (String valu){
                    if(valu.length>4){
                      setState(() {
                    
                        active = true;
                      });
                    }
                    else{
                      setState(() {
                        active = false;
                      });
                    }
                  },
                  ),
                  SizedBox(height: AppHeight.h20,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        checkColor: ColorManager.backgroundColor,
                        activeColor: ColorManager.white,
                        fillColor: MaterialStateProperty.all<Color>(Colors.black),
                        value:UserSimplePreferences.getRemember()?? ourValue,
                         onChanged: (val){
                          setState(() {
                           ourValue==false?ourValue=true:ourValue=false;
                          });
                          UserSimplePreferences.setRemember(ourValue);
                          if(UserSimplePreferences.getRemember()==false){
                            UserSimplePreferences.removeEmailPassword();
                          }
                          setState(() {
                            
                          });
                         }),
                         SmallText(text: "Remember me", weight: FontWeightManager.medium,color: ColorManager.boxText,)
                    ],
                  ),
                  SizedBox(height: AppHeight.h20,),
                  passwordController.text.isEmpty?AuthenticationWidget(text: "Sign in",color:active==false? ColorManager.boxBorderGrey:ColorManager.buttonColor,  textColor: ColorManager.white,):GestureDetector(
                    onTap: (){
                      if(emailController.text.isNotEmpty||passwordController.text.isNotEmpty){
                        context.read<LoginBloc>().add(LoginRequested(email: emailController.text.trim(), password: passwordController.text.trim()));
                      }
                    },
                    child: AnimatedAuthenticationWidget(
                      width: state is LoginLoading?60: MediaQuery.of(context).size.width,
                     color: ColorManager.buttonColor,
                    childes:state is LoginLoading?CircularProgressIndicator(color: ColorManager.white,): SmallText(text: "Sign In",color: ColorManager.white,weight: FontWeightManager.semibold,),
                    )),
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
                        SmallText(text: "Don't have an account? ", color: ColorManager.boxText,),
                        SmallText(text: "Sign Up", color: Colors.blue,),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );

        }, listener: (context,state){
          if(state is AuthError){
           showCustomSnackbar(context, state.error);
          }
          if(state is Authenticated){
             showCustomSnackbar(context, "Success");
             Navigator.pushReplacementNamed(context, Routes.shippingAddress);
          }
        })
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

