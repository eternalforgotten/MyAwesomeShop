import 'package:flutter/material.dart';
import 'package:shop/entities/cart_product.dart';
import 'package:shop/entities/order_product.dart';
import 'package:shop/entities/product.dart';

class Order {
  final String id;
  final String userId;
  final String name;
  final String dateTime;
  final String totalValue;
  final List<OrderProduct> products;

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
        products =  realProducts(data['orders_products']),
        userId = data['user_id'].toString();

  static List<OrderProduct> realProducts(List<dynamic> temp) {
    List<OrderProduct> prod = [];
    temp?.forEach((element) {
      prod.add(OrderProduct.fromJson(element));
    });
    return prod;
  }
}
