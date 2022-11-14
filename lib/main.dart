import 'package:ecommerce/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/forgot_password/create_new_password.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/forgot_password/select_contact.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/forgot_password/send_code.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/login_page.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/profile_fill.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/register_page.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/social_login.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/home_page.dart';
import 'package:flutter/material.dart';

import 'presentation/main_pages/authentication_pages/fingerprint.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomBarPage();
  }
}