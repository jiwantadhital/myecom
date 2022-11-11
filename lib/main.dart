import 'package:ecommerce/presentation/main_pages/authentication_pages/login_page.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/profile_fill.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/register_page.dart';
import 'package:ecommerce/presentation/main_pages/authentication_pages/social_login.dart';
import 'package:flutter/material.dart';

void main() {
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
    return ProfileFill();
  }
}