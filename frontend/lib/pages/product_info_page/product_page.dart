import 'package:flutter/material.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/pages/product_info_page/widgets/add_to_cart_button.dart';
import 'package:shop/pages/product_info_page/widgets/product_description.dart';
import 'package:shop/pages/product_info_page/widgets/product_info.dart';
import 'package:shop/pages/product_info_page/widgets/product_picture.dart';
import 'package:shop/widgets/custom_scroll_behaviour.dart';
import 'package:shop/services/responsive_size.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 35.height),
        child: Column(
          children: [
            Stack(
              children: [
                ProductPicture(product),
                Positioned(
                  top: 15.height,
                  left: -8.width,
                  child: RaisedButton(
                    elevation: 8,
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.height,
                      ),
                      ProductInfo(product),
                      SizedBox(
                        height: 10.height,
                      ),
                      ProductDescription(product),
                      SizedBox(
                        height: 39.height,
                      ),
                      AddToCartButton(product),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
