import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:ecommerce_app/viewmodel/cubit/home/home_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStatus> {
  HomeCubit() : super(HomeInitial());
  final homeService = HomeServiceImp();

  void getData() async {
    emit(HomeLoading());
    try {
      final products = await homeService.getData();
      emit(HomeLoaded(products, favProduct));
    } catch (e) {
      debugPrint('error raneem $e.toString()');
      emit(HomeError(errorMsg: e.toString()));
    }
  }

  void changeFavoriteStatus(Product newProduct, int index) {
    debugPrint('categories page1:${newProduct.productId}  1');
    newProduct = newProduct.copyWith(isFav: !newProduct.isFav);
     debugPrint('categories page1:${newProduct.productId}  2');
    if (newProduct.isFav) {
      favProduct.add(newProduct);
    } else {
      //search for a product to delete it

      favProduct.removeWhere(
          (product) => product.productName == newProduct.productName);
    }

    //issue to solve it from firestore
    //dummy_product[index] = newProduct;

    emit(HomeLoaded(dummy_product, favProduct));
  }
}
