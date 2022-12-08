import 'package:ecommerce/presentation/main_pages/categories/categories.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/home_page.dart';
import 'package:ecommerce/presentation/main_pages/order_page/my_orders.dart';
import 'package:ecommerce/presentation/main_pages/profile_pages/profile_page.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:flutter/material.dart';


class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _selectedIndex = 0;
  List pages = [
    HomePage(),
    Categories(),
    MyOrders(),
    ProfilePage(),
  ];
  void onTapNav(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorManager.buttonColor,
        unselectedItemColor: ColorManager.lightGrey,
        unselectedLabelStyle: TextStyle(
          color: ColorManager.lightGrey
        ),
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
            ),
        ],
        ),
    );
  }
}