import 'package:ecommerce_app/model/category.dart';

class CategoriesStatus {}

class CategoriesInitail extends CategoriesStatus {}

class CategoriesLoading extends CategoriesStatus {}

class CategoriesLoaded extends CategoriesStatus {
  List<Category> dummyCategories;
  CategoriesLoaded(this.dummyCategories);
}

class CategoriesError extends CategoriesStatus {
  final String errorMsg;

  CategoriesError({required this.errorMsg});
}
