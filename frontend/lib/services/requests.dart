import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shop/entities/cart.dart';
import 'package:shop/entities/cart_product.dart';
import 'package:shop/entities/order.dart';
import 'package:shop/entities/order_product.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/repos/user_repository.dart';

import '../repos/user_repository.dart';

class Requests {
  static const String SERVERURL = "http://192.168.0.82:3210";

  static Future<void> authorizeUser(String email, String password) async {
    String url = SERVERURL + "/user";
    var body = jsonEncode(
      {
        "user": {
          "name": "something",
          "email": email,
          "password": password,
        }
      },
    );
    http.Response response = await http.post(
      url,
      body: body,
      headers: {
        'Content-Type': 'application/json',
      }
    );
    print("${response.statusCode} signup");
    if (response.statusCode == 400) {
      UserRepository.errorMessage = "Ошибка регистрации";
    }
  }

  static Future<String> getToken(String email, String password) async {
    var body = jsonEncode(
      {
        "auth": {
          "email": email,
          "password": password,
        }
      },
    );
    String url = SERVERURL + "/user_token";
    http.Response response = await http.post(
      url,
      body: body,
      headers: {
        'Content-Type': 'application/json',
      }
    );
    print("${response.statusCode} gettoken");
    if (response.statusCode == 404) {
      UserRepository.errorMessage = "Ошибка входа";
      return null;
    } else {
      UserRepository.errorMessage = null;
      return jsonDecode(response.body)['jwt'];
    }
  }

  static Future<List<Product>> getProducts() async {
    String url = SERVERURL + "/products";
    List<Product> products = [];
    http.Response response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 204) {
      return products;
    } else {
      List<dynamic> temp = jsonDecode(response.body);
      temp.forEach((product) {
        products.add(Product.fromJson(product));
      });
      return products;
    }
  }

  static Future<List<Order>> getOrders() async {
    String url = SERVERURL + "/orders";
    List<Order> orders = [];
    http.Response response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: UserRepository.USERTOKEN,
      },
    );
    print(response.statusCode.toString() + " status orders");
    if (response.statusCode == 204) {
      return orders;
    } else {
      List<dynamic> temp = jsonDecode(response.body);
      temp.forEach((product) {
        orders.add(Order.fromJson(product));
      });
      return orders;
    }
  }

  static Future<Cart> getCart() async {
    String url = SERVERURL + "/cart";
    Cart cart;
    http.Response response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: UserRepository.USERTOKEN,
      },
    );
    if (response.statusCode == 204) {
      throw Exception();
    } else {
      cart = Cart.fromJson(jsonDecode(response.body));
      return cart;
    }
  }

  static Future<Order> getOrder(String id) async {
    String url = SERVERURL + "/orders/$id";
    Order order;
    http.Response response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: UserRepository.USERTOKEN,
      },
    );
    if (response.statusCode == 204) {
      throw Exception();
    } else {
      order = Order.fromJson(jsonDecode(response.body));
      return order;
    }
  }

  static Future<void> addProduct(String productId) async {
    int id = int.parse(productId);
    var body = jsonEncode({"id": id});
    String url = SERVERURL + "/cart/add";
    http.Response response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: UserRepository.USERTOKEN,
        'Content-Type': 'application/json',
      },
      body: body,
    );
    if (response.statusCode == 204) {
      throw Exception();
    } else {
      print(jsonDecode(response.body));
    }
  }

  static Future<void> removeProduct(String productId) async {
    int id = int.parse(productId);
    var body = jsonEncode({"product_id": id});
    String url = SERVERURL + "/cart/remove";
    http.Response response = await http.put(
      url,
      headers: {
        HttpHeaders.authorizationHeader: UserRepository.USERTOKEN,
        'Content-Type': 'application/json',
      },
      body: body,
    );
    if (response.statusCode == 204) {
      throw Exception();
    } else {
      //UserRepository.cart = jsonDecode(response.body);
    }
  }

  static Future<void> deleteProduct(String productId) async {
    int id = int.parse(productId);
    var body = jsonEncode({"product_id": id});
    String url = SERVERURL + "/cart/delete";
    http.Response response = await http.put(
      url,
      headers: {
        HttpHeaders.authorizationHeader: UserRepository.USERTOKEN,
        'Content-Type': 'application/json',
      },
      body: body,
    );
    if (response.statusCode == 204) {
      throw Exception();
    } else {
      //UserRepository.cart = jsonDecode(response.body);
    }
  }

  static Future<void> createOrder(
      List<CartProduct> products, List<Order> orders) async {
    String url = SERVERURL + "/orders";
    http.Response response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: UserRepository.USERTOKEN,
      },
    );
    if (response.statusCode == 400) {
      //TODO
    } else {
      orders.add(jsonDecode(response.body));
      products.clear();
    }
  }
}
