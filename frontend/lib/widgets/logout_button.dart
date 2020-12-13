import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shop/repos/user_repository.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context).settings.name;
    return IconButton(
      onPressed: () {
        print(route);
        if (route == "/orders"){
          Navigator.of(context).pushReplacementNamed("/");
        }
        UserRepository.logout(context); 
      },
      icon: Icon(
        Icons.logout,
      ),
    );
  }
}
