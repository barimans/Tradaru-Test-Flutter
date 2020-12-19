import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tradaru_test/data/model/product_model.dart';
import 'package:tradaru_test/data/repository/home_repository.dart';

import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({@required this.repository}) : super(null);
  @override
  HomeState get initialState => HomeStateInit();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchHomeEvent) {
      try{
        yield HomeStateLoading();
        Product _product = await repository.getData();
        List<ProductItem> _productItem = [];
        _product.productItem.forEach((value) {
          _productItem.add(value);
        });
        yield HomeStateLoaded(data: _productItem);
      }catch (e){
        yield HomeStateError(error: e.toString());
      }
    }

    if (event is GetDetailHomeEvent) {
      try{
        yield HomeStateLoading();
        Product _product = await repository.getData();
        List<ProductItem> _productItem = [];
        List<ProductItem> _productItemId = [];
        _product.productItem.forEach((value) {
          _productItem.add(value);
        });
        _productItemId = _productItem.where((element) => element.idProduct == event.id).toList();
        var dataProductItem = ProductItem(
          idProduct: _productItemId[0].idProduct,
          nameProduct: _productItemId[0].nameProduct,
          imageProduct: _productItemId[0].imageProduct,
          priceProduct: _productItemId[0].priceProduct,
          isFavorite: _productItemId[0].isFavorite,
          rating: _productItemId[0].rating,
          sold: _productItemId[0].sold,
          isDiscount: _productItemId[0].isDiscount,
          discounPrice: _productItemId[0].discounPrice,
        );
        yield DetailHomeStateLoaded(data: dataProductItem);
      }catch (e){
        yield HomeStateError(error: e.toString());
      }
    }
  }
}
