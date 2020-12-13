import 'package:flutter/material.dart';
import 'package:shop/routes.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        Navigator.of(context).pushNamed(MyRoutes.authRoute);
      },
      icon: Icon(
        Icons.login,
      ),
    );
  }
}