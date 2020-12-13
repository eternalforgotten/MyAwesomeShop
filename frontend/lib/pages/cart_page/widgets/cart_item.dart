import 'package:flutter/material.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/services/price.dart';
import 'package:shop/services/responsive_size.dart';

class CartItem extends StatelessWidget {
  final Product product;

  const CartItem(this.product);
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
                    product.imageURL,
                  ),
                ),),
          ),
          SizedBox(
            width: 34.width,
          ),
          Container(
            padding: EdgeInsets.only(top: 10.height),
            width: 200.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText1.fontFamily,
                        fontSize: 17.height,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {}, //TODO удаление
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
                  product.subtitle,
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
                Text(
                  "\$${(Price.normalize(product.price))}",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontFamily:
                        Theme.of(context).textTheme.bodyText1.fontFamily,
                    fontSize: 17.height,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
