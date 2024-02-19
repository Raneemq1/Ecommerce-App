import 'package:ecommerce_app/model/product.dart';

class Cart {
  final String id;
  Product shoppingItem;
  final String status;
  final int quantity;
  final double totalPrice;

  Cart(
      {required this.id,
      required this.shoppingItem,
      required this.quantity,
      required this.totalPrice,
      required this.status});
}

List<Cart> shoppingCart = [];
