import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/services/category_service.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:ecommerce_app/viewmodel/cubit/favorite/favorite_status.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteStatus> {
  FavoriteCubit() : super(FavoriteInitial());

  final _homeService = HomeServiceImp();
  final _categoryService = CategoryServiceImpl();

  void getData() async {
    emit(FavoriteLoading());
    try {
      final products = await _homeService.getData();
      final categories = await _categoryService.getData();
      emit(FavoriteLoaded(favProduct, categories, products));
    } catch (e) {
      emit(FavoriteError(errorMsg: e.toString()));
    }
  }

  void changeFavoriteStatus(Product newProduct) async {
    //remove from favProducts and update the value

    favProduct.removeWhere(
        (product) => product.productName == newProduct.productName);

    newProduct = newProduct.copyWith(isFav: false);
    //update product
    _homeService.updateProduct(newProduct);
    final products = await _homeService.getData();
    final categories = await _categoryService.getData();
    emit(FavoriteLoaded(favProduct, categories, products));
  }
}
