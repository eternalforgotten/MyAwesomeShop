import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cart_bloc/cart_bloc.dart';
import 'package:shop/entities/cart_product.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/main.dart';
import 'package:shop/services/price.dart';
import 'package:shop/services/responsive_size.dart';

class CartItem extends StatelessWidget {
  final CartProduct cartProduct;
  final Function onDelete;
  final Function onAdd;
  final Function onDecrement;


  const CartItem(this.cartProduct, {this.onAdd,this.onDecrement, this.onDelete});

  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.height,
      width: 345.width,
      padding: EdgeInsets.only(
        left: 14.width,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
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
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            height: 100.height,
            width: 80.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  cartProduct.product.imageURL,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 34.width,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10.height,
              right: 10.width,
            ),
            width: 200.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      cartProduct.product.title,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText1.fontFamily,
                        fontSize: 17.height,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: onDelete,
                      child: Icon(
                        Icons.close,
                        size: 28.height,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  cartProduct.product.subtitle,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText2.color,
                    fontFamily:
                        Theme.of(context).textTheme.bodyText2.fontFamily,
                    fontSize: 13.height,
                  ),
                ),
                SizedBox(
                  height: 15.height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 26.height,
                      width: 90.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xFFF2F5F8),
                        ),
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: onDecrement,
                            child: Icon(
                              Icons.remove,
                              size: 23.height,
                            ),
                          ),
                          Text(
                            cartProduct.quantity.toString(),
                            style: TextStyle(
                              fontSize: 16.height,
                            ),
                          ),
                          GestureDetector(
                            onTap: onAdd,
                            child: Icon(
                              Icons.add,
                              size: 20.height,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "\$${(Price.normalize(cartProduct.product.price))}",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText1.fontFamily,
                        fontSize: 17.height,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
