import 'package:ecommerce/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/login_page.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/register_page.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/home_page.dart';
import 'package:flutter/material.dart';

class Routes{
  static const String splashRoute = "/";
  static const String onBoardinghRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String bottomBarRoute = "/bottomBar";
  static const String recentRoute = "/recent";
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.loginRoute:
      return MaterialPageRoute(builder: (_)=>LoginPage());
      case Routes.registerRoute:
      return MaterialPageRoute(builder: (_)=>RegisterPage());
      case Routes.mainRoute:
      return MaterialPageRoute(builder: (_)=>HomePage());
      case Routes.bottomBarRoute:
      return MaterialPageRoute(builder: (_)=>BottomBarPage());;
      default:
      return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>
    Scaffold(
      appBar: AppBar(title: Text("Routes Not Found"),),
      body: Center(
        child: Text("Routes Not Found"),
      ),
    ),
    );
  }
}