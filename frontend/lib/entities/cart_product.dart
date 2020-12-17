import 'package:flutter/material.dart';
import 'package:shop/entities/product.dart';

import 'product.dart';

class CartProduct {
  final Product product;
  int quantity;


  CartProduct.fromJson(Map<String, dynamic> data) 
      : quantity = data["quantity"],
        product = Product.fromJson(data["product"]);

}