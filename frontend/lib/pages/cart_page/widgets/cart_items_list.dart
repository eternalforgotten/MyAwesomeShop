import 'package:flutter/material.dart';
import 'package:shop/entities/cart.dart';
import 'package:shop/pages/cart_page/widgets/cart_item.dart';
import 'package:shop/repos/user_repository.dart';
import 'package:shop/widgets/custom_scroll_behaviour.dart';
import 'package:shop/services/responsive_size.dart';

class CartItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (UserRepository.cart.products.length * 127.0).height,
      constraints: BoxConstraints(
        maxHeight: 340.height,
      ),
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: 15.width,
          ),
          itemCount: UserRepository.cart.products.length,
          itemBuilder: (_, index) => CartItem(UserRepository.cart.products[index]),
          separatorBuilder: (_, index) => SizedBox(
            height: 20.height,
          ),
        ),
      ),
    );
  }
}
