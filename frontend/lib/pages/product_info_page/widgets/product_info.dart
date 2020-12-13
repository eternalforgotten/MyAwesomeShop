import 'package:flutter/material.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/services/price.dart';
import 'package:shop/services/responsive_size.dart';

class ProductInfo extends StatelessWidget {
  final Product product;

  ProductInfo(this.product);

  List<Widget> stars(BuildContext context) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      var star = Icon(Icons.star,
          color: i < product.rating
              ? Theme.of(context).primaryColor
              : Color.fromRGBO(250, 112, 34, 0.35),
          size: 30.height);
      stars.add(star);
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.width),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.title,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1.color,
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  fontSize: 28.height,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "\$${Price.normalize(product.price)}",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1.color,
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  fontSize: 22.height,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.subtitle,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2.color,
                  fontFamily:
                      Theme.of(context).textTheme.bodyText2.fontFamily,
                  fontSize: 15.height,
                ),
              ),
              SizedBox(
                height: 8.height,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 90.width,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: stars(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
