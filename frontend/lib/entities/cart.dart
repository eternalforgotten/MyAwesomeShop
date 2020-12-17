import 'package:flutter/material.dart';
import 'package:shop/entities/cart_product.dart';
import 'package:shop/entities/product.dart';

class Cart {
  String id;
  String userId;
  List<CartProduct> cartsProducts;
  String totalValue;

  Cart({
    @required this.id,
    @required this.userId,
    @required this.cartsProducts,
    @required this.totalValue,
  });

  Cart.fromJson(Map<String, dynamic> data) 
      : userId = data['user_id'].toString(),
        cartsProducts = realProducts(data['carts_products']),
        id = data['id'].toString(),
        totalValue = data['value'].toString();

  static List<CartProduct> realProducts(List<dynamic> temp){
    List<CartProduct> prod = [];
    temp?.forEach((element) {
      prod.add(CartProduct.fromJson(element));
    });
    return prod;
  }
}