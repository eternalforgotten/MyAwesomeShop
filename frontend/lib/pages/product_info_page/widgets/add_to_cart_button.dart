import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/repos/user_repository.dart';
import 'package:shop/services/requests.dart';
import 'package:shop/services/responsive_size.dart';

class AddToCartButton extends StatefulWidget {
  final Product product;

  AddToCartButton(this.product);

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  StreamSubscription authSubscription;
  bool authorized = UserRepository.isAuth;

  @override
  void initState() {
    authSubscription = UserRepository.authStream.listen((event) {
      setState(() {
        authorized = event;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    authSubscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (authorized) {
          Requests.addProduct(UserRepository.cart.products, widget.product.id);
          showToast(
            "Товар добавлен в корзину",
            context: context,
            animation: StyledToastAnimation.fadeScale,
            animDuration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 3000),
            backgroundColor: Colors.black,
            position: StyledToastPosition.bottom,
            borderRadius: BorderRadius.circular(20)
          );
          //print();
        } else {
          showToast(
            "Войдите или зарегистрируйтесь, чтобы добавлять товары в корзину",
            context: context,
            animation: StyledToastAnimation.fadeScale,
            animDuration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 3000),
            backgroundColor: Colors.black,
            position: StyledToastPosition.bottom,
            borderRadius: BorderRadius.circular(20)
          );
        }
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 20.height,
        ),
        alignment: Alignment.center,
        height: 53.height,
        width: 345.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "Добавить в корзину",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 17.height,
            fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
          ),
        ),
      ),
    );
  }
}
