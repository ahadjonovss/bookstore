import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shopee/components/routes/app_routes.dart';
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

  _printFCMTOKEN() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print("FCM TOKEN:$token");
  }

  _handleFirebaseNotificationMessages() async {
    //pn fg mode
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('On Foreground');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print(' Recieved notification : ${message.notification}');
        print(message.notification!.title);
        print(message.notification!.body);
      }
    });
  }

  _setupInteractedMessage() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    //on Terminate mode
    if (initialMessage != null) {
      if (initialMessage.data['route'] == 'users') {
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, RouteName.mngUsers);
      }
    }

    //on bg mode
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['route'] == 'users') {
        Navigator.pushNamed(context, RouteName.mngUsers);
      }
    });
  }

  @override
  void initState() {
    _printFCMTOKEN();
    _handleFirebaseNotificationMessages();
    _setupInteractedMessage();
    super.initState();
  }

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
                if(currentPage==0){
                  showDialog(context: context, builder: (context) => AddCategoryDialog(categoryController: categoryController));
                }
                if(currentPage==1){
                  Navigator.pushNamed(context, RouteName.addProductPage);
                }
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
