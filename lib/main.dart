
import 'dart:io';

import 'package:ecommerce/presentation/splash/splash_screen.dart';
import 'package:ecommerce/routes/route_manager.dart';
import 'package:flutter/material.dart';

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0)),
      ),
      onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
    );
  }
}

