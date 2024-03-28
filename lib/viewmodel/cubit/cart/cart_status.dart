import 'package:ecommerce_app/model/cart.dart';
import 'package:ecommerce_app/model/product.dart';

class CartStatus {}

class CartInitial extends CartStatus {}

class CartLoaded extends CartStatus {
  List<Cart> shoppingItems;
  List<Product> products;
  double totalPrice;
  CartLoaded(this.shoppingItems, this.products,this.totalPrice);
}

class CartLoading extends CartStatus {}

class CartError extends CartStatus {
  final String errorMsg;

  CartError(this.errorMsg);
}
