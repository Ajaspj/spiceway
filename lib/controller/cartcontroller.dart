import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spiceway/model/productmodel.dart';

class Cartcontroller extends ChangeNotifier {
  final List<ProductModel> _cart = [];
  List<ProductModel> get cart => _cart;
  void toggleFavorite(ProductModel product) {
    if (_cart.contains(product)) {
      for (ProductModel element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  incrementQtn(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  decrementQtn(int index) {
    if (_cart[index].quantity <= 1) {
      return;
    }
    _cart[index].quantity--;
    notifyListeners();
  }

  totalPrice() {
    double total1 = 0.0;
    for (ProductModel element in _cart) {
      total1 += element.price * element.quantity;
    }
    return total1;
  }

  static Cartcontroller of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<Cartcontroller>(
      context,
      listen: listen,
    );
  }
}
