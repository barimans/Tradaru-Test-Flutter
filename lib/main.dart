import 'package:flutter/material.dart';
import 'package:tradaru_test/utils/res_color.dart';
import 'package:tradaru_test/utils/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tradaru Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ResColor.colorPrimary,
        scaffoldBackgroundColor: ResColor.colorLightGrey,
      ),
      routes: Routes().route,
      initialRoute: Routes.splash,
    );
  }
}
