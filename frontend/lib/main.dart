import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cart_bloc/cart_bloc.dart';
import 'package:shop/pages/auth_page/auth_page.dart';
import 'package:shop/pages/my_orders_page/my_orders_page.dart';
import 'package:shop/pages/products_page/products_page.dart';
import 'package:shop/repos/user_repository.dart';
import 'package:shop/routes.dart';
import 'package:shop/services/responsive_size.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final cartBloc = CartBloc();
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final cart = BlocProvider<CartBloc>(create: (_) => cartBloc);
    return MultiBlocProvider(
      providers: [
        cart,
      ],
      child: MaterialApp(
        builder: (context, child) {
          ResponsiveSize.init(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          );
          return child;
        },
        title: 'MyAwesomeShop',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          disabledColor: Colors.grey,
          primaryColor: Color(0xFFFA7022),
          accentColor: Color(0xFF0C2944),
          cardColor: Color(0xFFF5F7FE),
        ),
        routes: {
          MyRoutes.productsRoute: (_) => ProductsPage(),
          MyRoutes.ordersRoute: (_) => MyOrdersPage(),
          MyRoutes.authRoute: (_) => AuthPage(),
        },
      ),
    );
  }
}
