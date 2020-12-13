import 'package:flutter/material.dart';
import 'package:shop/pages/cart_page/cart_page.dart';
import 'package:shop/repos/user_repository.dart';
import 'package:shop/services/responsive_size.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 4.height,
      ),
      child: IconButton(
        icon: Icon(Icons.shopping_cart_outlined),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CartPage(),
            ),
          );
        },
      ),
    );
  }
}
