import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:ecommerce_app/services/favorite_service.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:ecommerce_app/services/user_service.dart';
import 'package:ecommerce_app/viewmodel/cubit/home/home_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStatus> {
  HomeCubit() : super(HomeInitial());
  final homeService = HomeServiceImp();
  final favoriteService = FavoriteServiceImpl();
  final _userService = UserServiceImp();
  final _authService = AuthenticationServiceImpl();

  void getData() async {
    emit(HomeLoading());
    try {
      final products = await homeService.getData();
      final user = await _authService.currentUser();
      //instead of this use getCertain data to return specifc data
      var prefrencesUser = await favoriteService.getData();
      emit(HomeLoaded(products, prefrencesUser));
    } catch (e) {
      debugPrint('error raneem $e.toString()');
      emit(HomeError(errorMsg: e.toString()));
    }
  }

  void changeFavoriteStatus(Product newProduct) async {
    bool isFav = false;
    //newProduct = newProduct.copyWith(isFav: !newProduct.isFav);

    //get the data before edit
    var products = await homeService.getData();
    var prefrencesUser = await favoriteService.getData();
    

    isFav = prefrencesUser.contains(newProduct);
  
    if (!isFav) {
      favoriteService.setData(newProduct.productId);
      //favProduct.add(newProduct);
    } else {
      //search for a product to delete it
      debugPrint('homecubit: ${newProduct.productId}');
      favoriteService.deleteData(newProduct.productId);
    }

    debugPrint('homecubit: ${newProduct.productName}');

//after edit
    prefrencesUser = await favoriteService.getData();
   
    emit(HomeLoaded(products, prefrencesUser));
  }
}
