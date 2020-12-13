import 'package:flutter/material.dart';
import 'package:shop/main.dart';
import 'package:shop/pages/products_page/widgets/products_overview.dart';
import 'package:shop/widgets/custom_appbar.dart';
import 'package:shop/widgets/custom_drawer.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar("Продукты"),
      drawer: CustomDrawer(),
      body: ProductsOverview(),
    );
  }
}