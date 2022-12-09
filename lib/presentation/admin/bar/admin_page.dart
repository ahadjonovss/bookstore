import 'package:flutter/material.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_categories_page.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_products_page.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_users_page.dart';
import 'package:shopee/presentation/admin/bar/tabs/widgets/add_category_dialog.dart';
// ignore: must_be_immutable
class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int currentPage = 0;

  TextEditingController categoryController=TextEditingController();

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
        actions: [
          IconButton(
              onPressed: () {
                showDialog(context: context, builder: (context) => AddCategoryDialog(categoryController: categoryController));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage=value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user), label: ""),
        ],
      ),
    );
  }
}
