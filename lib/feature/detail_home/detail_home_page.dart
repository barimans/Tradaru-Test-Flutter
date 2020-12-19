import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradaru_test/data/repository/home_repository.dart';
import 'package:tradaru_test/feature/detail_home/detail_home_screen.dart';
import 'package:tradaru_test/feature/home/bloc/bloc.dart';
import 'package:tradaru_test/utils/app_text_style.dart';
import 'package:tradaru_test/utils/res_color.dart';

class DetailHomeArguments {
  final int idProduct;

  DetailHomeArguments({this.idProduct});
}

class DetailHomePage extends StatelessWidget {
  final DetailHomeArguments data;

  const DetailHomePage({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: ResColor.colorPrimary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Detail Product',
            style: AppTextStyle.largeText.copyWith(
                color: ResColor.colorPrimary,
                fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
        ),
        body: BlocProvider<HomeBloc>(
          create: (BuildContext context) =>
              HomeBloc(repository: HomeRepository()),
          child: DetailHomeScreen(data: data,),
        ),
      ),
    );
  }
}
