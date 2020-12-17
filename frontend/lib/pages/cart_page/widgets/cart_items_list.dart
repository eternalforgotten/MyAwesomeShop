import 'package:flutter/material.dart';
import 'package:shop/cart_bloc/cart_bloc.dart';
import 'package:shop/main.dart';
import 'package:shop/pages/cart_page/widgets/cart_item.dart';
import 'package:shop/repos/user_repository.dart';
import 'package:shop/widgets/custom_scroll_behaviour.dart';
import 'package:shop/services/responsive_size.dart';

class CartItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CartItem> _getCart() {
      List<CartItem> dishes = [];
      for (var cartProduct in UserRepository.cart.cartsProducts) {
        dishes.add(CartItem(
          cartProduct,
          onAdd: () {
            MyApp.cartBloc.add(AddEvent(cartProduct.product.id));
          },
          onDecrement: () {
            MyApp.cartBloc.add(RemoveEvent(cartProduct.product.id));
          },
          onDelete: () {
            MyApp.cartBloc.add(DeleteEvent(cartProduct.product.id));
          },
        ));
      }

      return dishes;
    }

    return Container(
      height: (_getCart().length * 127.0).height,
      constraints: BoxConstraints(
        maxHeight: 340.height,
      ),
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: 15.width,
          ),
          itemCount: _getCart().length,
          itemBuilder: (_, index) =>
              _getCart()[index],
          separatorBuilder: (_, index) => SizedBox(
            height: 20.height,
          ),
        ),
      ),
    );
  }
}
