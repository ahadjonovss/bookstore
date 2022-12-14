import 'package:flutter/material.dart';
import 'package:shopee/presentation/admin/bar/add_product_page.dart';
import 'package:shopee/presentation/admin/bar/add_product_second.dart';
import 'package:shopee/presentation/admin/bar/admin_page.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_categories_page.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_products_page.dart';
import 'package:shopee/presentation/admin/bar/tabs/manage_users_page.dart';
import 'package:shopee/presentation/auth/sign_in_page.dart';
import 'package:shopee/presentation/auth/sing_up_page.dart';
import 'package:shopee/presentation/home/bar/main_page.dart';
import 'package:shopee/presentation/home/bar/tabs/cart_page.dart';
import 'package:shopee/presentation/home/bar/tabs/home_page.dart';
import 'package:shopee/presentation/home/bar/tabs/profile_page.dart';
import 'package:shopee/presentation/home/bar/tabs/search_page.dart';
import 'package:shopee/presentation/splash_page.dart';

import '../../presentation/admin/add_images_to_book.dart';

class RouteName{
  static const splash="splash";
  static const signIn="signin";
  static const signUp="signUp";
  static const homePage="home";
  static const cartPage="cart";
  static const profilePage="profilePage";
  static const searchPage="searchPage";
  static const mainPage="mainPage";

  //admin pages
  static const mngUsers="mngUsers";
  static const mngProducts="mngProducts";
  static const mngCategories="mngCategories";
  static const adminPage="adminPage";
  static const addProductPage="addProductPage";
  static const addImagesToProduct="addImageToProduct";
  static const addAllImagesToProduct="addAllImagesToProduct";
}

class AppRoutes{

  static Route generateRote(RouteSettings settings){
    dynamic args=settings.arguments;

    switch(settings.name){
      //admin pages
      case RouteName.mngCategories:
        return MaterialPageRoute(builder: (_)=>const ManageCategoriesPage());
      case RouteName.addAllImagesToProduct:
        return MaterialPageRoute(builder: (_)=> AddAllImagesToBook(newbook: args));
      case RouteName.addImagesToProduct:
        return MaterialPageRoute(builder: (_)=> AddImagesToProduct(newBook: args,));
      case RouteName.mngProducts:
        return MaterialPageRoute(builder: (_)=>const ManageProductsPage());
      case RouteName.mngUsers:
        return MaterialPageRoute(builder: (_)=>const ManageUsersPage());
      case RouteName.adminPage:
        return MaterialPageRoute(builder: (_)=> const AdminPage());
      case RouteName.addProductPage:
        return MaterialPageRoute(builder: (_)=>  AddProductPage());

    //auth pages
      case RouteName.signIn:
        return MaterialPageRoute(builder: (_)=>const SignInPage());
      case RouteName.splash:
        return MaterialPageRoute(builder: (_)=> const SplashPage());
      case RouteName.signUp:
        return MaterialPageRoute(builder: (_)=>const SignUpPage());

        //home pages
      case RouteName.homePage:
        return MaterialPageRoute(builder: (_)=>const HomePage());
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