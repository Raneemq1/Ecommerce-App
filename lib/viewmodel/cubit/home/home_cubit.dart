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

  void changeFavoriteStatus(Product newProduct) async {
    
    newProduct = newProduct.copyWith(isFav: !newProduct.isFav);
   
    if (newProduct.isFav) {
      favProduct.add(newProduct);
    } else {
      //search for a product to delete it
    debugPrint('homecubit: ${newProduct.productId}');
      favProduct.removeWhere(
          (product) => product.productName == newProduct.productName);
    }
    debugPrint('homecubit:');
debugPrint('homecubit: ${newProduct.productName}');
    //update isFav
    homeService.updateProduct(newProduct);
   

    //get data after update 
    final products = await homeService.getData();
    emit(HomeLoaded(products, favProduct));
  }
}
