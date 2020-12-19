import 'package:flutter/material.dart';
import 'package:tradaru_test/feature/basket/basket_page.dart';
import 'package:tradaru_test/feature/detail_home/detail_home_page.dart';
import 'package:tradaru_test/feature/favorite/favorite_page.dart';
import 'package:tradaru_test/feature/feed/feed_page.dart';
import 'package:tradaru_test/feature/home/home_page.dart';
import 'package:tradaru_test/feature/main_product/main_product_screen.dart';
import 'package:tradaru_test/feature/notification/notification_page.dart';
import 'package:tradaru_test/feature/profile/profile_page.dart';
import 'package:tradaru_test/feature/splash/splash_screen.dart';

class Routes{
  static String splash = "/splash";
  static String mainProduct = "/mainProduct";
  static String home = "/home";
  static String favorite = "/favorite";
  static String basket = "/basket";
  static String feed = "/feed";
  static String profile = "/profile";
  static String detailHome = "/detailhome";
  static String notification = "/notification";

  final route = <String, WidgetBuilder>{
    Routes.splash: (context) => SplashScreen(),
    Routes.mainProduct: (context) => MainProductScreen(),
    Routes.home: (context) => HomePage(),
    Routes.favorite: (context) => FavoritePage(),
    Routes.basket: (context) => BasketPage(),
    Routes.feed: (context) => FeedPage(),
    Routes.profile: (context) => ProfilePage(),
    Routes.detailHome: (context) => DetailHomePage(
      data: ModalRoute.of(context).settings.arguments,
    ),
    Routes.notification: (context) => NotificationPage(),
  };

}