import 'package:ecommerce_app/viewmodel/cubit/categories_state.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesStatus> {
  CategoriesCubit() : super(CategoriesInitail());

  void getData() async {
    emit(CategoriesLoading());
    try {
      await Future.delayed(Duration(seconds: 2));
      emit(CategoriesLoaded(dummy_categories));
    } catch (e) {
      emit(CategoriesError(errorMsg: e.toString()));
    }
  }
}
