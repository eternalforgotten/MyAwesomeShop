import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:shop/entities/order.dart';
import 'package:shop/entities/cart.dart';
import 'package:shop/services/requests.dart';

class UserRepository {
  static String USERTOKEN;
  static String errorMessage;
  static bool isAuth = false;

  static void logout(BuildContext context) {
    USERTOKEN = null;
    isAuth = false;
    showToast(
      "Вы успешно вышли из аккаунта",
      context: context,
      animation: StyledToastAnimation.fadeScale,
      animDuration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 3000),
      backgroundColor: Colors.black,
      position: StyledToastPosition.bottom,
      borderRadius: BorderRadius.circular(20),
    );
    _streamController.add(isAuth);
  }

  static Future<String> login(String email, String password) async {
    USERTOKEN = await Requests.getToken(email, password);
    if (USERTOKEN != null) {
      isAuth = true;
      _streamController.add(isAuth);
    }
    return errorMessage;
  }

  static Future<String> signUp(String email, String password) async {
    await Requests.authorizeUser(email, password);
    USERTOKEN = await Requests.getToken(email, password);
    if (USERTOKEN != null) {
      isAuth = true;
      _streamController.add(isAuth);
    }
    return errorMessage;
  }

  static final StreamController _streamController =
      StreamController<bool>.broadcast();

  static final Stream authStream = _streamController.stream;

  static List<Order> orders = [];
  static Cart cart;
  static int cartItemsLength = 0;
}
