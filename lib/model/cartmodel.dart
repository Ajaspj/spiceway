import 'package:spiceway/model/productmodel.dart';

class CartModel {
  Product product;
  int qty;
  CartModel({required this.product, this.qty = 1});
}
