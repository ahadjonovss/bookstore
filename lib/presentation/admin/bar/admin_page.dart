import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopee/data/repositories/admin/admin_repository.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_categories_page.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_products_page.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_users_page.dart';

class AdminPage extends StatelessWidget {
   AdminPage({Key? key}) : super(key: key);

  int currentPage=0;

  @override
  Widget build(BuildContext context) {
    List pages=[
      ManageCategoriesPage(),
      ManageProductsPage(),
      ManageUsersPage(),
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Admin Page"),actions: [IconButton(onPressed: (){AdminRepository(firebaseFirestore: FirebaseFirestore.instance).createCategory();}, icon: Icon(Icons.add))],),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.book),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user),label: ""),
        ],
      ),

    );
  }
}
