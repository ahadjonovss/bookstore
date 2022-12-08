import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/data/models/category_model.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_categories_page.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_products_page.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_users_page.dart';
import 'package:shopee/view_models/admin/categories_view_model.dart';

class AdminPage extends StatelessWidget {
  AdminPage({Key? key}) : super(key: key);

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [
      ManageCategoriesPage(),
      ManageProductsPage(),
      ManageUsersPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Page"),
        actions: [IconButton(onPressed: () {context.read<CategoriesViewModel>().addCategory(CategoryModel(categoryName: "Abdurauf", docId: ''));}, icon: Icon(Icons.add))],
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user), label: ""),
        ],
      ),
    );
  }
}
