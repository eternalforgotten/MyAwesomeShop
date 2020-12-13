import 'package:flutter/material.dart';
import 'package:shop/services/requests.dart';

class Product {
  String id;
  final String title;
  final String subtitle;
  final String price;
  final String description;
  final int rating;
  final String imageURL;

  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.rating,
    @required this.subtitle,
    @required this.imageURL,
  });

  Product.fromJson(Map<String, dynamic> data)
      : id = data['id'].toString(),
        title = data['name'] ?? ' ',
        subtitle = data['subname'] ?? ' ',
        price = data['value'],
        description = data['description'] ?? ' ',
        rating = data['rating'],
        imageURL = Requests.SERVERURL + data['picture']['url'] ?? ' ';

}
