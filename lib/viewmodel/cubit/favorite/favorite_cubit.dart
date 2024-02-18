import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/viewmodel/cubit/favorite/favorite_status.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteStatus> {
  FavoriteCubit() : super(FavoriteInitial());

  void getData() async {
    emit(FavoriteLoading());
    try {
      await Future.delayed(Duration(seconds: 2));
      emit(FavoriteLoaded(dummy_product,favProduct,dummy_categories));
    } catch (e) {
      emit(FavoriteError(errorMsg: e.toString()));
    }
  }
}
