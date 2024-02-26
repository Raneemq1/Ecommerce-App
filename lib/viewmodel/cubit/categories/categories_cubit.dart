import 'package:ecommerce_app/services/category_service.dart';
import 'package:ecommerce_app/viewmodel/cubit/categories/categories_state.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesStatus> {
  CategoriesCubit() : super(CategoriesInitail());
  final _categoryService = CategoryServiceImpl();

  void getData() async {
    emit(CategoriesLoading());
    try {
      final categoryData = await _categoryService.getData();
      emit(CategoriesLoaded(categoryData));
    } catch (e) {
      emit(CategoriesError(errorMsg: e.toString()));
    }
  }
}
