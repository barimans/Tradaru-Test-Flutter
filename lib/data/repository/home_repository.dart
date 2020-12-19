import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tradaru_test/data/model/product_model.dart';

class HomeRepository{
  Future<Product> getData() async{
    var jsonString = await rootBundle.loadString('assets/data/product_item.json');
    final jsonData = json.decode(jsonString);
    Product product = Product.fromJson(jsonData);
    return product;
  }
}