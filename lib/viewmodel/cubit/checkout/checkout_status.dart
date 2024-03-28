import 'package:ecommerce_app/model/cart.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/model/user.dart';

class CheckoutStatus {}

class CheckoutInitial extends CheckoutStatus {}

class CheckoutLoading extends CheckoutStatus {}

class CheckoutSucess extends CheckoutStatus {
  List<Cart> shoppingItems;
  List<Product> products;
  String address;
  CheckoutSucess(this.shoppingItems,this.address,this.products);
}

class CheckoutError extends CheckoutStatus {
  String message;
  CheckoutError(this.message);
}