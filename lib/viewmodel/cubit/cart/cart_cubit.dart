import 'package:ecommerce_app/model/cart.dart';
import 'package:ecommerce_app/services/cart_service.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:ecommerce_app/viewmodel/cubit/cart/cart_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStatus> {
  CartCubit() : super(CartInitial());
  final homeService = HomeServiceImp();
  final cartService = CartServiceImp();

  void getData() async {
    emit(CartLoading());
    try {
      var products = await homeService.getData();
      var orders = await cartService.getData();
      double totalPrice=0;
      orders.forEach((order)=>totalPrice+=order.totalPrice);
      emit(CartLoaded(orders, products,totalPrice));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  void deleteOrder(String cartId) async {
     cartService.deleteData(cartId);
     var products = await homeService.getData();
      var orders = await cartService.getData();
      double totalPrice=0;
      orders.forEach((order)=>totalPrice+=order.totalPrice); 
      emit(CartLoaded(orders, products,totalPrice));
  }
}
