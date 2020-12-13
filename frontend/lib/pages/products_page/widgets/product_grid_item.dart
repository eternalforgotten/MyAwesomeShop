import 'package:flutter/material.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/pages/product_info_page/product_page.dart';
import 'package:shop/services/price.dart';
import 'package:shop/services/responsive_size.dart';

class ProductGridItem extends StatelessWidget {
  final int index;
  final Product product;
  ProductGridItem({
    this.index,
    @required this.product,
  });
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductPage(product),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 13.height,
          left: 11.width,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: TextStyle(
                fontSize: 15.height,
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
            ),
            Text(
              product.subtitle,
              style: TextStyle(
                fontSize: 10.height,
                fontFamily: Theme.of(context).textTheme.bodyText2.fontFamily,
                color: Theme.of(context).textTheme.bodyText2.color,
              ),
            ),
            Text(
              "\$ ${Price.normalize(product.price)}",
              style: TextStyle(
                fontSize: 14.height,
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //color: Colors.indigo,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    product.imageURL,
                  )
                )
              ),
              width: 130,
              height: index.isEven ? 159 : 85,
            ),
          ],
        ),
      ),
    );
  }
}
