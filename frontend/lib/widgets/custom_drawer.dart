import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop/repos/user_repository.dart';
import 'package:shop/routes.dart';
import 'package:shop/services/responsive_size.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
  @override
  Widget build(BuildContext context) {
    var currentRoute = ModalRoute.of(context).settings.name;
    return Container(
      width: 200.width,
      child: Drawer(
        child: Container(
          color: Theme.of(context).accentColor,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 120.height),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.width,
                    vertical: 20.height,
                  ),
                  color: Colors.white,
                  child: Text(
                    "MyAwesomeShop",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.height,
                    ),
                  ),
                ),
                SizedBox(
                  height: 150.height,
                ),
                Container(
                  width: 140.width,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    onPressed: () {
                      if (currentRoute == MyRoutes.productsRoute) {
                        Navigator.of(context).pop();
                      } else {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed(MyRoutes.productsRoute);
                      }
                    },
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.width,
                      vertical: 8.height,
                    ),
                    child: Text(
                      "Продукты",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.height,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.height,
                ),
                Container(
                  width: 140.width,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    onPressed: authorized 
                    ?  () {
                      if (currentRoute == MyRoutes.ordersRoute) {
                        Navigator.of(context).pop();
                      } else {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed(MyRoutes.ordersRoute);
                      }
                    }
                    :
                    null,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.width,
                      vertical: 8.height,
                    ),
                    child: Text(
                      "Мои заказы",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.height,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
