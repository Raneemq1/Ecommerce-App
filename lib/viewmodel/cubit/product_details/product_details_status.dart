class ProductDetailsStatus {}

class ProductDetailsInitail extends ProductDetailsStatus {}

class ProductDetailsLoading extends ProductDetailsStatus {}

class ProductDetailsLoaded extends ProductDetailsStatus {}

class ProductDetailsError extends ProductDetailsStatus {
  final String errorMsg;
  ProductDetailsError(this.errorMsg);
}
