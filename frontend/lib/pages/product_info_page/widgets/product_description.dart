import 'package:flutter/material.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/services/responsive_size.dart';

class ProductDescription extends StatelessWidget {
  final Product product;

  ProductDescription(this.product);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.width,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Описание",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontSize: 16.height,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 14.height,
          ),
          Text(
            product.description,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText2.color,
              fontFamily: Theme.of(context).textTheme.bodyText2.fontFamily,
              fontSize: 13.height,
            ),
          ),
        ],
      ),
    );
  }
}
