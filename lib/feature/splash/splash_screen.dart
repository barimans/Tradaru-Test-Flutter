import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tradaru_test/utils/app_text_style.dart';
import 'package:tradaru_test/utils/res_color.dart';
import 'package:tradaru_test/utils/route.dart';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final splashDelay = 3;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacementNamed(context, Routes.mainProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Icon(
                  Icons.shopping_basket,
                  size: 150,
                  color: ResColor.colorPrimary,
                ),
                SizedBox(height: 10,),
                Text(
                  'T R A D A R U',
                  style: AppTextStyle.extraLargeText.copyWith(
                    color: ResColor.colorPrimary,
                    fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
