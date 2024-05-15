import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spiceway/model/productmodel.dart';

class Favoritecontroller extends ChangeNotifier {
  final List<Product> favorateslist = [];
  List<Product> get favorites => favorateslist;
  void toggleFavorite(Product product) {
    if (favorateslist.contains(product)) {
      favorateslist.remove(product);
    } else {
      favorateslist.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = favorateslist.contains(product);
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
