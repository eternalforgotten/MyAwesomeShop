import 'package:flutter/material.dart';
import 'package:shop/entities/cart_product.dart';
import 'package:shop/entities/order.dart';
import 'package:shop/entities/order_product.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/services/price.dart';
import 'package:shop/services/requests.dart';
import 'package:shop/services/responsive_size.dart';

class OrderItem extends StatefulWidget {
  final Order order;

  OrderItem({this.order});
  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  List<OrderProduct> products = [];
  bool _expanded = false;

  Widget _buildNonExpanded() {
    String dateTime = widget.order.dateTime.split('.')[0];
    String date = dateTime.substring(0, 10);
    String time = dateTime.substring(11);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Заказ ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.height,
          ),
        ),
        Text(
          "#:${widget.order.name} ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.height,
          ),
        ),
        Text(
          "$date $time",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.height,
          ),
        ),
      ],
    );
  }

  Widget _buildExpanded() {
    return Column(
      children: [
        _buildNonExpanded(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.width,
          ),
          margin: EdgeInsets.only(
            top: 20.height,
            left: 10.width,
            right: 10.width,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Товары:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.height,
                ),
              ),
              SizedBox(
                height: 10.height,
              ),
              ...products.map(
                (cartProduct) => Container(
                  height: 25.height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100.width,
                        child: Text(
                          cartProduct.product.title,
                        ),
                      ),
                      Spacer(
                        flex: 12,
                      ),
                      Text(
                        Price.normalize(cartProduct.product.price),
                        style: TextStyle(
                          fontSize: 13.height,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "x" + cartProduct.quantity.toString(),
                        style: TextStyle(
                          fontSize: 13.height,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: 50.width,
                        child: Text(
                          (double.parse(cartProduct.product.price) *
                                  cartProduct.quantity)
                              .toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 15.height,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 10.height,
            left: 10.width,
            right: 10.width,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10.width,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Итого: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.height,
                ),
              ),
              Text(
                "${Price.normalize(widget.order.totalValue)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.height,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Requests.getOrder(widget.order.id).then(
          (value) => setState(() {
            products = value.products;
          }),
        );

        _expanded = !_expanded;
      },
      child: AnimatedContainer(
        padding: EdgeInsets.only(
          top: 15.height,
        ),
        margin: EdgeInsets.only(
          bottom: 20.height,
        ),
        height: _expanded ? (products.length * 25.0 + 130).height : 50.height,
        duration: Duration(milliseconds: 200 * (1 + products.length ~/ 9)),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.38)),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: _expanded ? _buildExpanded() : _buildNonExpanded(),
      ),
    );
  }
}
