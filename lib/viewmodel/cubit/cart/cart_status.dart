import 'package:ecommerce_app/model/cart.dart';
import 'package:ecommerce_app/model/product.dart';

class CartStatus {}

class CartInitial extends CartStatus {}

class CartLoaded extends CartStatus {
  List<Cart> shoppingItems;
  List<Product> products;
  CartLoaded(this.shoppingItems,this.products);
}

class CartLoading extends CartStatus {}

class CartError extends CartStatus {
  final String errorMsg;

  CartError(this.errorMsg);
}
