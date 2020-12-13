import 'package:flutter/material.dart';
import 'package:shop/entities/order.dart';
import 'package:shop/pages/my_orders_page/widgets/order_item.dart';
import 'package:shop/repos/user_repository.dart';
import 'package:shop/services/requests.dart';
import 'package:shop/services/responsive_size.dart';

class OrdersList extends StatefulWidget {
  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  var _isInit = false;

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      Requests.getOrders().then((value) => setState(() {
            UserRepository.orders = value;
          }));
    }
    _isInit = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 5.width, vertical: 10.height),
      itemBuilder: (_, index) => OrderItem(
        order: UserRepository.orders[index],
      ),
      itemCount: UserRepository.orders.length,
    );
  }
}
