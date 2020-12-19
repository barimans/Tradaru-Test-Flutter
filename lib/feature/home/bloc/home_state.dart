import 'package:equatable/equatable.dart';
import 'package:tradaru_test/data/model/product_model.dart';

class HomeState extends Equatable {
  @override
  List<Object> get props => null;
}

class HomeStateInit extends HomeState {}

class HomeStateLoaded extends HomeState {
  final List<ProductItem> data;

  HomeStateLoaded({this.data});
  List<Object> get props => [data];
}

class HomeStateLoading extends HomeState {}

class HomeStateError extends HomeState {
  final String error;

  HomeStateError({this.error});
}

class DetailHomeStateLoaded extends HomeState {
  final ProductItem data;

  DetailHomeStateLoaded({this.data});
  List<Object> get props => [data];
}
