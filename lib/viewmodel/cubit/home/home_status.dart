import 'package:ecommerce_app/model/product.dart';

class HomeStatus {}

class HomeInitial extends HomeStatus {}

class HomeLoading extends HomeStatus {}

class HomeLoaded extends HomeStatus {
  List<Product> dummyProducts;

  HomeLoaded(this.dummyProducts);
}

class HomeError extends HomeStatus {
  final String errorMsg;

  HomeError({required this.errorMsg});
}

class UpdateFavorite extends HomeStatus {
  List<Product> favProducts;
  List<Product> dummyProducts;
  UpdateFavorite(this.favProducts, this.dummyProducts);
}
