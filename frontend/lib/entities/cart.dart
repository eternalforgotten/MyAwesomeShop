import 'package:flutter/material.dart';
import 'package:shop/entities/product.dart';

class Cart {
  String id;
  String userId;
  List<Product> products;
  String totalValue;

  Cart({
    @required this.id,
    @required this.userId,
    @required this.products,
    @required this.totalValue,
  });

  Cart.fromJson(Map<String, dynamic> data) 
      : userId = data['user_id'].toString(),
        products = realProducts(data['products']),
        id = data['id'].toString(),
        totalValue = data['value'].toString();

  static List<Product> realProducts(List<dynamic> temp){
    List<Product> prod = [];
    temp.forEach((element) {
      prod.add(Product.fromJson(element));
    });
    return prod;
  }
}