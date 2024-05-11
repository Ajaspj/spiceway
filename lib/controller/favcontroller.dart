import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spiceway/model/productmodel.dart';

class Favoritecontroller extends ChangeNotifier {
  final List<Product> _favorites = [];
  List<Product> get favorites => _favorites;
  void toggleFavorite(Product product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = _favorites.contains(product);
    return isExist;
  }

  static Favoritecontroller of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<Favoritecontroller>(
      context,
      listen: listen,
    );
  }
}
