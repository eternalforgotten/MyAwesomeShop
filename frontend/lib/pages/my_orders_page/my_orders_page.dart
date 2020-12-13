import 'package:flutter/material.dart';
import 'package:shop/pages/my_orders_page/widgets/orders_list.dart';

import 'package:shop/widgets/custom_appbar.dart';
import 'package:shop/widgets/custom_drawer.dart';

class MyOrdersPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar("Мои заказы"),
      drawer: CustomDrawer(),
      body: Container(
        alignment: Alignment.topCenter,
        child: OrdersList(),
      ),
    );
  }
}
