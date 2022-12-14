import 'package:ecommerce/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/login_page.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/register_page.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/social_login.dart';
import 'package:ecommerce/presentation/main_pages/cart/cart_page.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/home_page.dart';
import 'package:ecommerce/presentation/main_pages/shipping_address/shipping_address.dart';
import 'package:ecommerce/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes{
  static const String splashRoute = "/";
  static const String social = "/social";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String bottomBarRoute = "/bottomBar";
  static const String recentRoute = "/recent";
  static const String cartRoute = "/cart";
  static const String shippingAddress = "/shippingAddress";
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
      return MaterialPageRoute(builder: (_)=>BottomBarPage());
            case Routes.splashRoute:
      return MaterialPageRoute(builder: (_)=>SplashScreen());
              case Routes.social:
      return MaterialPageRoute(builder: (_)=>SocialLogin());
              case Routes.cartRoute:
      return MaterialPageRoute(builder: (_)=>CartPage());
      case Routes.shippingAddress:
      return MaterialPageRoute(builder: (_)=>ShippingAddress());
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