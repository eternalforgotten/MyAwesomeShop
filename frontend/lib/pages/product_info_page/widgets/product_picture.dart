import 'package:flutter/material.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/services/responsive_size.dart';

class ProductPicture extends StatelessWidget {
  final Product product;

  ProductPicture(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            product.imageURL
          ),
        )
      ),
    );
  }
}