import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/viewmodel/cubit/favorite/favorite_status.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteStatus> {
  FavoriteCubit() : super(FavoriteInitial());

  void getData() async {
    emit(FavoriteLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(FavoriteLoaded(favProduct, dummy_categories));
    } catch (e) {
      emit(FavoriteError(errorMsg: e.toString()));
    }
  }

  void changeFavoriteStatus(Product newProduct) {
    //remove from favProducts and update the value

    favProduct
        .removeWhere((product) => product.productName == newProduct.productName);

    int index = dummy_product
        .indexWhere((product) => product.productName == newProduct.productName);
    dummy_product[index] = dummy_product[index].copyWith(isFav: false);
    emit(FavoriteLoaded( favProduct, dummy_categories));
  }
}
