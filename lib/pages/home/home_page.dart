import 'package:flutter/material.dart';
import 'package:foo_delivery/pages/account/account_page.dart';
import 'package:foo_delivery/pages/auth/sign_in_page.dart';
import 'package:foo_delivery/pages/auth/sign_up_page.dart';
import 'package:foo_delivery/pages/cart/cart_history.dart';
import 'package:foo_delivery/pages/home/main_food_page.dart';
import 'package:foo_delivery/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List pages = [
    MainFoodPage(),
    SignInPage(),
    CartHistory(),
    AccountPage(),
  ];
  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: "history"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "me"),
        ],
      ),
    );
  }
}
