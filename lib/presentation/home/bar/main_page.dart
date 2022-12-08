import 'package:flutter/material.dart';
import 'package:shopee/presentation/home/bar/tabs/cart_page.dart';
import 'package:shopee/presentation/home/bar/tabs/home_page.dart';
import 'package:shopee/presentation/home/bar/tabs/profile_page.dart';
import 'package:shopee/presentation/home/bar/tabs/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage=0;
  List pages=[
    HomePage(),
    CartPage(),
    SearchPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions:[IconButton(icon: const Icon(Icons.admin_panel_settings),onPressed: (){})] ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance),label: ""),
        ],
      ),
    );
  }
}
