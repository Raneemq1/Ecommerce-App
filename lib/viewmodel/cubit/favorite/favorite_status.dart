import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';

class FavoriteStatus {}

class FavoriteInitial extends FavoriteStatus {}

class FavoriteLoading extends FavoriteStatus {}

class FavoriteLoaded extends FavoriteStatus {
  List<Product> favProducts;
  List<Category> dummyCategorites;
  List<Product> dummyProducts;

  FavoriteLoaded(this.favProducts, this.dummyCategorites,this.dummyProducts);
}

class FavoriteError extends FavoriteStatus {
  final String errorMsg;

  FavoriteError({required this.errorMsg});
}
