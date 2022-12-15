import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/components/routes/app_routes.dart';
import 'package:shopee/data/repositories/admin/auth_repository.dart';
import 'package:shopee/data/repositories/admin/categories_repository.dart';
import 'package:shopee/data/repositories/admin/products_repository.dart';
import 'package:shopee/data/repositories/auth_repository.dart';
import 'package:shopee/view_models/admin/auth_view_model.dart';
import 'package:shopee/view_models/admin/categories_view_model.dart';
import 'package:shopee/view_models/admin/products_view_model.dart';
import 'package:shopee/view_models/auth_view_model.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    Provider(
      create: (context) => AuthViewModel(
          authRepository: AuthRepository(firebaseAuth: FirebaseAuth.instance)),
    ),
    ChangeNotifierProvider(create: (context)=>UsersViewModel(authRepository: UserRepository(firebaseFirestore: FirebaseFirestore.instance))),
    ChangeNotifierProvider(create: (context) => CategoriesViewModel(categoriesRepository: CategoriesRepository(firebaseFirestore: FirebaseFirestore.instance)),),
    ChangeNotifierProvider(create: (context)=>ProductsViewModel(productsRepository: ProductsRepository(firebaseFirestore: FirebaseFirestore.instance)))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoutes.generateRote,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splash,
    );
  }
}
