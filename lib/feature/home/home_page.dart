import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradaru_test/data/repository/home_repository.dart';

import 'bloc/home_bloc.dart';
import './home_screen.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<HomeBloc>(
          create: (BuildContext context) =>
              HomeBloc(repository: HomeRepository()),
          child: HomeScreen(),
        ),
      ),
    );
  }
}
