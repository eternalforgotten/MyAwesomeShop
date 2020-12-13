import 'package:flutter/material.dart';
import 'package:shop/entities/cart.dart';
import 'package:shop/services/price.dart';
import 'package:shop/services/responsive_size.dart';

class OrderBill extends StatelessWidget {
  final Cart cart;

  OrderBill({
    @required this.cart,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.height,
      width: 345.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: Offset(-4, -4),
            blurRadius: 10,
            color: Color.fromRGBO(0, 0, 0, 0.05),
          ),
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: Color.fromRGBO(0, 0, 0, 0.05),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 29.width,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Итого",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1.color,
                fontFamily:
                    Theme.of(context).textTheme.bodyText1.fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 15.height,
              ),
            ),
            Text(
              "\$ ${Price.normalize(cart.totalValue)}",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1.color,
                fontFamily:
                    Theme.of(context).textTheme.bodyText1.fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 15.height,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
