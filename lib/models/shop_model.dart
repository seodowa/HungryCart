import 'package:flutter/material.dart';
import 'package:hungrycart/models/product_model.dart';

List<Map> data = [
  {
    "productName": "Mega Sardines",
    "productDescription": "Regular Mega Sardines",
    "productPrice": 34.00,
    "productImgPath": "assets/mega-sardines-green.png"
  },
  {
    "productName": "Mega Sardines Spicy",
    "productDescription": "Spicy Mega Sardines",
    "productPrice": 34.00,
    "productImgPath": "assets/mega-sardines-pula.png"
  }
];

class ShopModel extends ChangeNotifier {
  final List<Product> _products = [
    for (int i = 0; i < 20; i++)
      Product(
          productName: data[i % 2]["productName"],
          productDescription: data[i % 2]["productDescription"],
          productPrice: data[i % 2]["productPrice"],
          productImgPath: data[i % 2]["productImgPath"])
  ];
  final List<Product> _cart = [];

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  double getCartTotal() {
    double sum = 0;

    for (var item in _cart) {
      sum += item.productPrice;
    }

    return sum;
  }

  List<Product> get products => _products;
  List<Product> get cart => _cart;
}
