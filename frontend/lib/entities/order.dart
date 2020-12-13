import 'package:flutter/material.dart';
import 'package:shop/entities/product.dart';

class Order {
  final String id;
  final String userId;
  final String name;
  final String dateTime;
  final String totalValue;
  final List<Product> products;

  Order({
    @required this.id,
    @required this.userId,
    @required this.name,
    @required this.dateTime,
    @required this.totalValue,
    @required this.products,
  });

  Order.fromJson(Map<String, dynamic> data)
      : name = data['name'],
        id = data['id'].toString(),
        dateTime = data['created_at'],
        totalValue = data['value'],
        products =  realProducts(data['products']),
        userId = data['user_id'].toString();

  static List<Product> realProducts(List<dynamic> temp) {
    List<Product> prod = [];
    temp?.forEach((element) {
      prod.add(Product.fromJson(element));
    });
    return prod;
  }
}
