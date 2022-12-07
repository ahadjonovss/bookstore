import 'package:flutter/material.dart';
import 'package:shopee/presentation/auth/sign_in_page.dart';
import 'package:shopee/presentation/auth/sing_up_page.dart';

class RouteName{
  static const home="home";
  static const signIn="signin";
  static const signUp="signUp";
}

class AppRoutes{

  static Route generateRote(RouteSettings settings){
    dynamic args=settings.arguments;

    switch(settings.name){
      case RouteName.signIn:
        return MaterialPageRoute(builder: (_)=>const SignInPage());
      case RouteName.signUp:
        return MaterialPageRoute(builder: (_)=>const SignUpPage());
      default: return MaterialPageRoute(builder: (_)=>const Scaffold());
    }

  }
}