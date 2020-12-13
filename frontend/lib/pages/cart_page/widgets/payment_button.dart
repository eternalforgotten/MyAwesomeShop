import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shop/entities/cart.dart';
import 'package:shop/main.dart';
import 'package:shop/repos/user_repository.dart';
import 'package:shop/services/requests.dart';
import 'package:shop/services/responsive_size.dart';

class PaymentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (UserRepository.cart.products.isNotEmpty) {
          showToast(
            "Заказ оформлен",
            context: context,
            animation: StyledToastAnimation.fadeScale,
            animDuration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 3000),
            backgroundColor: Colors.black,
            position: StyledToastPosition.bottom,
            borderRadius: BorderRadius.circular(20)
          );
          Navigator.of(context).pop();
          await Requests.createOrder(UserRepository.cart.products, UserRepository.orders);   
        }
        else {
          showToast(
            "Корзина пуста",
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
        alignment: Alignment.center,
        height: 53.height,
        width: 345.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "Оформить заказ",
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
