import 'package:ecommerce_app/model/cart.dart';

class CartStatus {}

class CartInitial extends CartStatus {}

class CartLoaded extends CartStatus {
  List<Cart> shoppingItems;
  CartLoaded(this.shoppingItems);
}

class CartLoading extends CartStatus {}

class CartError extends CartStatus {
  final String errorMsg;

  CartError(this.errorMsg);
}
