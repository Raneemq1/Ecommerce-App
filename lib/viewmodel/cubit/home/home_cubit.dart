import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/viewmodel/cubit/home/home_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStatus> {
  HomeCubit() : super(HomeInitial());

  void getData() async {
    emit(HomeLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(HomeLoaded(dummy_product));
    } catch (e) {
      emit(HomeError(errorMsg: e.toString()));
    }
  }

  void changeFavoriteStatus(Product newProduct, int index) {
    newProduct = newProduct.copyWith(isFav: !newProduct.isFav);
    if (newProduct.isFav) {
      favProduct.add(newProduct);
    } else {
      favProduct.remove(newProduct);
    }
    dummy_product[index] = newProduct;
    emit(HomeLoaded(dummy_product));
  }
}
