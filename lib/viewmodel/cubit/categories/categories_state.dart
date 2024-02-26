import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';

class CategoriesStatus {}

class CategoriesInitail extends CategoriesStatus {}

class CategoriesLoading extends CategoriesStatus {}

class CategoriesLoaded extends CategoriesStatus {
  List<Category> dummyCategories;
  List<Product> dummyProducts;
  CategoriesLoaded(this.dummyCategories,this.dummyProducts);
}

class CategoriesError extends CategoriesStatus {
  final String errorMsg;

  CategoriesError({required this.errorMsg});
}
