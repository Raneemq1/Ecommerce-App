import 'package:ecommerce_app/model/product.dart';

class ProductDetailsStatus {}

class ProductDetailsInitail extends ProductDetailsStatus {}

class ProductDetailsLoading extends ProductDetailsStatus {}

class ProductDetailsLoaded extends ProductDetailsStatus {
  final Product prdouct;

  ProductDetailsLoaded(this.prdouct);
}

class ProductDetailsError extends ProductDetailsStatus {
  final String errorMsg;
  ProductDetailsError(this.errorMsg);
}

class QuantityChanged extends ProductDetailsStatus {
  final int quantity;
  QuantityChanged(this.quantity);
}

class SizeChange extends ProductDetailsStatus {
  final ProductSize size;
  SizeChange(this.size);
}
