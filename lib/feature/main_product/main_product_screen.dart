import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tradaru_test/feature/basket/basket_page.dart';
import 'package:tradaru_test/feature/favorite/favorite_page.dart';
import 'package:tradaru_test/feature/feed/feed_page.dart';
import 'package:tradaru_test/feature/home/home_page.dart';
import 'package:tradaru_test/feature/profile/profile_page.dart';
import 'package:tradaru_test/utils/app_text_style.dart';
import 'package:tradaru_test/utils/res_color.dart';
import 'package:tradaru_test/utils/route.dart';

class MainProductScreen extends StatefulWidget {
  @override
  _MainProductScreenState createState() => _MainProductScreenState();
}

class _MainProductScreenState extends State<MainProductScreen> {

  int _pageIndex = 2;
  final List<Widget> _pageView = [
    BasketPage(),
    FavoritePage(),
    HomePage(),
    FeedPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Icon(
                Icons.shopping_basket,
                size: 24,
                color: ResColor.colorPrimary,
              ),
              SizedBox(width: 10,),
              Text(
                'T r a d a r u',
                style: AppTextStyle.largeText.copyWith(
                    color: ResColor.colorPrimary,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: ResColor.colorPrimary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.notification);
              },
            )
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60.0,
          backgroundColor: ResColor.colorLightGrey,
          index: _pageIndex,
          items: <Widget>[
            _pageIndex == 0 ?
            Icon(
              Icons.shopping_cart,
              size: 30,
              color: ResColor.colorPrimary,
            ) :
            Icon(
              Icons.shopping_cart_outlined,
              size: 25,
              color: ResColor.colorDarkGrey,
            ),
            _pageIndex == 1 ?
            Icon(
              Icons.favorite,
              size: 30,
              color: ResColor.colorPrimary,
            ) :
            Icon(
              Icons.favorite_border_outlined,
              size: 25,
              color: ResColor.colorDarkGrey,
            ),
            _pageIndex == 2 ?
            Icon(
              Icons.home,
              size: 30,
              color: ResColor.colorPrimary,
            ) :
            Icon(
              Icons.home_outlined,
              size: 25,
              color: ResColor.colorDarkGrey,
            ),
            _pageIndex == 3 ?
            Icon(
              Icons.assignment,
              size: 30,
              color: ResColor.colorPrimary,
            ) :
            Icon(
              Icons.assignment_outlined,
              size: 25,
              color: ResColor.colorDarkGrey,
            ),
            _pageIndex == 4 ?
            Icon(
              Icons.person,
              size: 30,
              color: ResColor.colorPrimary,
            ) :
            Icon(
              Icons.person_outline,
              size: 25,
              color: ResColor.colorDarkGrey,
            ),
          ],
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
        ),
        body: Container(
          child: _pageView[_pageIndex]
        ),
      ),
    );
  }
}
