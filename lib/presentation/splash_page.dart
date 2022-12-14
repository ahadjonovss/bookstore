import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopee/components/routes/app_routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser);
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushNamedAndRemoveUntil(
          context, FirebaseAuth.instance.currentUser==null?RouteName.signUp:RouteName.adminPage, (route) => false);
      });
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Splash",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
