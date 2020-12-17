import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../../entities/product.dart';
import '../../../repos/user_repository.dart';
import '../../../services/requests.dart';
import '../../../services/responsive_size.dart';

class ProductManager extends StatefulWidget {
  final Product product;

  ProductManager(this.product);
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  StreamSubscription authSubscription;
  bool authorized = UserRepository.isAuth;

  @override
  void initState() {
    authSubscription = UserRepository.authStream.listen((event) {
      setState(() {
        authorized = event;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    authSubscription.cancel();
    super.dispose();
  }

  Widget _buildQuantityManager(BuildContext context,
      {@required IconData icon, @required Function action}) {
    return GestureDetector(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(7),
        ),
        alignment: Alignment.center,
        height: 35.height,
        width: 35.height,
        child: Icon(
          icon,
          color: Colors.white,
          size: 28.height,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print((UserRepository.cart != null).toString() + " cart lol");
    return Container(
      width: 100.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildQuantityManager(
            context,
            icon: Icons.remove,
            action: () {
              if (authorized) {
              } else {
                showToast(
                  "Войдите или зарегистрируйтесь, чтобы удалять товары из корзины",
                  context: context,
                  animation: StyledToastAnimation.fadeScale,
                  animDuration: Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 3000),
                  backgroundColor: Colors.black,
                  position: StyledToastPosition.bottom,
                  borderRadius: BorderRadius.circular(20),
                );
              }
            },
          ),
          Text(
            "1",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Theme.of(context).textTheme.bodyText1.color,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontSize: 28.height,
            ),
          ),
          _buildQuantityManager(
            context,
            icon: Icons.add,
            action: () async {
              if (authorized) {
                // Requests.getCart().then(
                //   (value) => setState(() {
                //     UserRepository.cart ??= value;
                //   }),
                // );
                await Requests.addProduct(widget.product.id);
                showToast(
                  "Товар добавлен в корзину",
                  context: context,
                  animation: StyledToastAnimation.fadeScale,
                  animDuration: Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 3000),
                  backgroundColor: Colors.black,
                  position: StyledToastPosition.bottom,
                  borderRadius: BorderRadius.circular(20),
                );
                //print();
              } else {
                showToast(
                  "Войдите или зарегистрируйтесь, чтобы добавлять товары в корзину",
                  context: context,
                  animation: StyledToastAnimation.fadeScale,
                  animDuration: Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 3000),
                  backgroundColor: Colors.black,
                  position: StyledToastPosition.bottom,
                  borderRadius: BorderRadius.circular(20),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
