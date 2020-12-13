import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop/repos/user_repository.dart';
import 'package:shop/widgets/cart_button.dart';
import 'package:shop/widgets/login_button.dart';
import 'package:shop/widgets/logout_button.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  @override
  _CustomAppbarState createState() => _CustomAppbarState();

  @override
  final Size preferredSize;

  CustomAppbar(this.title) : preferredSize = Size.fromHeight(60);
}

class _CustomAppbarState extends State<CustomAppbar> {

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
    print(authorized);
    List<Widget> actions = authorized
        ? [
            LogoutButton(),
            CartButton(),
          ]
        : [
            LoginButton(),
          ];
    return AppBar(
      actions: actions,
      backgroundColor: Theme.of(context).accentColor,
      centerTitle: true,
      title: Text(
        widget.title,
        style: TextStyle(),
      ),
    );
  }
}
