import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/model/user.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:ecommerce_app/services/cart_service.dart';
import 'package:ecommerce_app/services/category_service.dart';
import 'package:ecommerce_app/services/favorite_service.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:ecommerce_app/services/user_service.dart';
import 'package:ecommerce_app/viewmodel/cubit/favorite/favorite_status.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteStatus> {
  FavoriteCubit() : super(FavoriteInitial());

  final _homeService = HomeServiceImp();
  final _categoryService = CategoryServiceImpl();
  final _authService = AuthenticationServiceImpl();
  final _userService = UserServiceImp();
  final favoriteService = FavoriteServiceImpl();

  void getData() async {
    emit(FavoriteLoading());
    try {
       

      final products = await _homeService.getData();
      final categories = await _categoryService.getData();
     
      var prefrencesUser = await favoriteService.getData();

      emit(FavoriteLoaded(prefrencesUser, categories, products));
    } catch (e) {
      emit(FavoriteError(errorMsg: e.toString()));
    }
  }

  void changeFavoriteStatus(Product newProduct) async {
    final products = await _homeService.getData();
    
    //remove from favProducts and update the value
     favoriteService.deleteData(newProduct.productId);

    var prefrencesUser = await favoriteService.getData();
  
  

    final categories = await _categoryService.getData();
    emit(FavoriteLoaded(prefrencesUser, categories, products));
  }
}
