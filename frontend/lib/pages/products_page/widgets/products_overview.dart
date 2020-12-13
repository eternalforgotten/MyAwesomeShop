import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/pages/products_page/widgets/product_grid_item.dart';
import 'package:shop/services/requests.dart';
import 'package:shop/widgets/custom_scroll_behaviour.dart';
import 'package:shop/services/responsive_size.dart';

class ProductsOverview extends StatefulWidget {
  @override
  _ProductsOverviewState createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  List<Product> products = [];

  @override
  void initState() {
    Requests.getProducts().then((list) => setState(() {
          products = list;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15.width,
      ),
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: StaggeredGridView.countBuilder(
          padding: EdgeInsets.symmetric(
            vertical: 20.height,
          ),
          crossAxisCount: 4,
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) => ProductGridItem(
            index: index,
            product: products[index],
          ),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 2.6 : 1.8),
          mainAxisSpacing: 18.height,
          crossAxisSpacing: 9.width,
        ),
      ),
    );
  }
}
