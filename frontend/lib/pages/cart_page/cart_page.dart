import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cart_bloc/cart_bloc.dart';
import 'package:shop/entities/cart.dart';
import 'package:shop/pages/cart_page/widgets/cart_items_list.dart';
import 'package:shop/pages/cart_page/widgets/order_bill.dart';
import 'package:shop/pages/cart_page/widgets/payment_button.dart';
import 'package:shop/repos/user_repository.dart';
import 'package:shop/services/requests.dart';
import 'package:shop/services/responsive_size.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    Requests.getCart().then(
      (value) => setState(() {
        UserRepository.cart = value;
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print((UserRepository.cart != null).toString() + " cart");
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        print(state.toString());
        if (state is CartLoadingState){
          return CircularProgressIndicator();
        }
        else if (state is CartUpdateState) {
          return Container(
            margin: EdgeInsets.only(
              top: 50,
            ),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: BackButton(
                      color: Colors.black,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                CartItemsList(),
                SizedBox(
                  height: 15.height,
                ),
                OrderBill(
                  cart: UserRepository.cart,
                ),
                SizedBox(
                  height: 27.height,
                ),
                PaymentButton(),
              ],
            ),
          );
        }
        else {
          return Center(
            child: Text("Что-то не так"),
          );
        }
      }),
    );
  }
}
