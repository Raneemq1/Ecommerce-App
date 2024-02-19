import 'package:ecommerce_app/model/product.dart';

class Cart {
  final String id;
  Product shoppingItem;
  final String status;

  Cart({required this.id, required this.shoppingItem, required this.status});
}

List<Cart> shoppingCart = [];
