import 'package:ecommerce_app/model/category.dart';

class CategoriesStatus {}

class CategoriesInitail extends CategoriesStatus {}

class CategoriesLoading extends CategoriesStatus {}

class CategoriesLoaded extends CategoriesStatus {
  List<Category> dummy_categories;
  CategoriesLoaded(this.dummy_categories);
}

class CategoriesError extends CategoriesStatus {
  final String errorMsg;

  CategoriesError({required this.errorMsg});
}
