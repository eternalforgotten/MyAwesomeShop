import 'package:flutter/material.dart';
import 'package:shop/entities/product.dart';

import 'product.dart';

class OrderProduct {
  final Product product;
  int quantity;


  OrderProduct.fromJson(Map<String, dynamic> data) 
      : quantity = data["quantity"],
        product = Product.fromJson(data["product"]);

}