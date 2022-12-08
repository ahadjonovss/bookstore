import 'package:flutter/material.dart';
import 'package:shopee/presentation/auth/sign_in_page.dart';
import 'package:shopee/presentation/auth/sing_up_page.dart';
import 'package:shopee/presentation/home/bar/main_page.dart';
import 'package:shopee/presentation/home/bar/tabs/cart_page.dart';
import 'package:shopee/presentation/home/bar/tabs/home_page.dart';
import 'package:shopee/presentation/home/bar/tabs/profile_page.dart';
import 'package:shopee/presentation/home/bar/tabs/search_page.dart';
import 'package:shopee/presentation/splash_page.dart';

class RouteName{
  static const splash="splash";
  static const signIn="signin";
  static const signUp="signUp";
  static const homePage="home";
  static const cartPage="cart";
  static const profilePage="profilePage";
  static const searchPage="searchPage";
  static const mainPage="mainPage";
}

class AppRoutes{

  static Route generateRote(RouteSettings settings){
    dynamic args=settings.arguments;

    switch(settings.name){
      case RouteName.signIn:
        return MaterialPageRoute(builder: (_)=>const SignInPage());
      case RouteName.homePage:
        return MaterialPageRoute(builder: (_)=>const HomePage());
      case RouteName.splash:
        return MaterialPageRoute(builder: (_)=> const SplashPage());
      case RouteName.signUp:
        return MaterialPageRoute(builder: (_)=>const SignUpPage());
      case RouteName.cartPage:
        return MaterialPageRoute(builder: (_)=>const CartPage());
      case RouteName.profilePage:
        return MaterialPageRoute(builder: (_)=>const ProfilePage());
      case RouteName.searchPage:
        return MaterialPageRoute(builder: (_)=>const SearchPage());
      case RouteName.mainPage:
        return MaterialPageRoute(builder: (_)=>const MainPage());
      default: return MaterialPageRoute(builder: (_)=>const Scaffold());
    }

  }
}